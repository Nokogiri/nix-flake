{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.services.forgejo;
  srv = cfg.settings.server;
in 
{
  sops.secrets.forgejo_mail = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.services.forgejo.user;
    group = config.services.forgejo.group;
  };
  sops.secrets.forgejo_pg = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.services.forgejo.user;
    group = config.services.forgejo.group;
  };
  sops.secrets.forgejo_runner.owner = "forgejo";
  services.gitea-actions-runner = {
    package = pkgs.forgejo-actions-runner;
    instances.default = {
      enable = true;
      name = "monolith";
      url = "https://forge.fishoeder.net";
      # Obtaining the path to the runner token file may differ
      # tokenFile should be in format TOKEN=<secret>, since it's EnvironmentFile for systemd
      tokenFile = config.sops.secrets.forgejo_runner.path;
      labels = [
        #"ubuntu-latest:docker://node:16-bullseye"
	"ubuntu-latest:docker://catthehacker/ubuntu:act-latest"
	"ubuntu-22.04:docker://catthehacker/ubuntu:act-22.04"
        #"ubuntu-22.04:docker://node:16-bullseye"
        #"ubuntu-20.04:docker://node:16-bullseye"
        #"ubuntu-18.04:docker://node:16-buster"     
        ## optionally provide native execution on the host:
        "native:host"
      ];
    };
  };
  services.forgejo = {
    enable = true;
    package = pkgs.forgejo;
    database = {
      type = "postgres";
      name = "forgejo";
      passwordFile = config.sops.secrets.forgejo_pg.path;
      createDatabase = false;
    };
    lfs.enable = true;
    secrets.mailer.PASSWD = config.sops.secrets.forgejo_mail.path;
    settings = {
      actions = {
        ENABLED = true;
        DEFAULT_ACTIONS_URL = "github";
      };
      session = {
        COOKIE_SECURE = true;
        PROVIDER = "redis";
        PROVIDER_CONFIG = "network=unix,addr=/run/redis-forgejo/redis.sock";
      };
      service = {
        DISABLE_REGISTRATION = true;
        REQUIRE_SIGNIN_VIEW = false;
        ENABLE_TIMETRACKING = false;
        SHOW_REGISTRATION_BUTTON = false;
        SHOW_MILESTONES_DASHBOARD_PAGE = false;
      };
      server = {
        DOMAIN = "forge.fishoeder.net";
        PROTOCOL = "http+unix";
        ROOT_URL = "https://forge.fishoeder.net";
        STATIC_URL_PREFIX = "/_/static";
        DISABLE_SSH = false;
      };
      repository = {
        ENABLE_PUSH_CREATE_USER = true;
        DEFAULT_PUSH_CREATE_PRIVATE = false;
      };
      mailer = {
        ENABLED = true;
        FROM = "forgejo@fishoeder.net";
        SMTP_ADDR = "smtp.gmail.com";
        SMTP_PORT = "465";
        USER = "nokogiri@gefjon.org";
        PROTOCOL = "smtps";
      };
      other = {
        SHOW_FOOTER_VERSION = false;
      };
      indexer = {
        REPO_INDEXER_ENABLED = true;
        REPO_INDEXER_PATH = "indexers/repos.bleve";
        MAX_FILE_SIZE = "1048576";
        REPO_INDEXER_INCLUDE = "";
        REPO_INDEXER_EXCLUDE = "resources/bin/**";
      };
      federation = {
        ENABLED = true;
      };
      cache = {
        ENABLED = true;
        ADAPTER = "redis";
        HOST = "network=unix,addr=/run/redis-forgejo/redis.sock";
        ITEM_TTL = "24h";
      };
      "cache.lastcommit" = {
        ENABLED = true;
        COMMITS_COUNT = "100";
      };
    };
  };

  sops.secrets.forgejo_admin.owner = "forgejo";
  systemd.services.forgejo.preStart = let
    adminCmd = "${lib.getExe cfg.package} admin user";
    pwd = config.sops.secrets.forgejo_admin;
    user = "nokogiri"; # Note, Forgejo doesn't allow creation of an account named "admin"
  in ''
    ${adminCmd} create --admin --email "nokogiri@gefjon.org" --username ${user} --password "$(tr -d '\n' < ${pwd.path})" || true
    ## uncomment this line to change an admin user which was already created
    # ${adminCmd} change-password --username ${user} --password "$(tr -d '\n' < ${pwd.path})" || true
  '';
  services.redis.servers."forgejo" = {
    enable = true;
    user = config.services.forgejo.user;
  };
  services.nginx = {
    #upstreams = {
    #  servers = { "forgejo" = "unix:${config.services.forgejo.settings.server.HTTP_ADDR}"; };
    #};
    virtualHosts = {
      "forge.fishoeder.net" = {
        forceSSL = true;
        useACMEHost = "fishoeder.net";
        extraConfig = "client_max_body_size 512M;";
        locations."/_/static/assets/" = {
          alias = "${config.services.forgejo.package.data}/public/assets/";
        };
        locations."/" = {
          proxyPass = "http://unix:/${config.services.forgejo.settings.server.HTTP_ADDR}";
          extraConfig =
            "proxy_set_header Host $host;"
            + "proxy_set_header X-Real-IP $remote_addr;"
            + "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
            + "proxy_set_header X-Forwarded-Proto $scheme;";
        };
      };
    };
  };
}
