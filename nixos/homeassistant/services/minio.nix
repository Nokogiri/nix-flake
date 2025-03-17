{ config, ...}:{
  sops.secrets.minio = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.users.users.nobody.name;
    group = config.users.users.nobody.group;
    mode = "0666";
  };

  services.minio = {
    enable = true;
    browser = true;
    listenAddress = ":9000";
    consoleAddress = ":9001";
    rootCredentialsFile = config.sops.secrets.minio.path;
    dataDir = ["/media/Vault0.1/MinIO"];
    region = "us-east-1";
  };

  services.nginx.virtualHosts."s3.fishoeder.net" = {
    useACMEHost = "fishoeder.net";
    forceSSL = true;
    extraConfig = ''
      ignore_invalid_headers off;
      client_max_body_size 0;
      proxy_buffering off;
      proxy_request_buffering off;
    '';
    locations = {
      "/" = {
        proxyPass = "http://localhost:9000";
        extraConfig = "proxy_set_header Host $host;"
      + "proxy_set_header X-Real-IP $remote_addr;"
      + "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
      + "proxy_set_header X-Forwarded-Proto $scheme;"
      + "proxy_connect_timeout 300;"
      # Default is HTTP/1, keepalive is only enabled in HTTP/1.1
      + "proxy_http_version 1.1;"
      + ''proxy_set_header Connection "";''
      + "chunked_transfer_encoding off;";
      };
      #"/minio/ui/" = {
      #  proxyPass = "http://localhost:9001";
      #  extraConfig = "rewrite ^/minio/ui/(.*) /$1 break;"
      #  + "proxy_set_header Host $host;"
      #  + "proxy_set_header X-Real-IP $remote_addr;"
      #  + "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
      #  + "proxy_set_header X-Forwarded-Proto $scheme;"
      #  + "proxy_set_header X-NginX-Proxy true;"
        # This is necessary to pass the correct IP to be hashed
      #  + "real_ip_header X-Real-IP;"
      #  + "proxy_connect_timeout 300;"
        # To support websockets in MinIO versions released after January 2023
      #  + "proxy_http_version 1.1;"
      #  + "proxy_set_header Upgrade $http_upgrade;"
      #  + ''proxy_set_header Connection "upgrade";''

        # Some environments may encounter CORS errors (Kubernetes + Nginx Ingress)
        # Uncomment the following line to set the Origin request to an empty string
        # proxy_set_header Origin '';

      #  + "chunked_transfer_encoding off;";
      #};
    };
  };
}
