{
  sops = {
    age.keyFile = "/home/nokogiri/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    secrets.spotify = {
      path = "%r/spotify.txt";
    };
  };
}
