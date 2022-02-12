{ home-manager, ... }:
{
  users.users.jono = {
    description = "Jonathan Dickinson";
    isNormalUser = true;
    hashedPassword = "$6$AZgI1JKcAWZvzYFJ$hqboha1.QPu2SdbcGjRU0wGmHUdLXgyKtQWrd5unAM9B30BO2Zv84C9kDujJ.gIGjAn837K8.vylxIBlK4Apk1";
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
