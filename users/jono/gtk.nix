{ pkgs, ... }:

let
  extraConfig = {
    gtk-application-prefer-dark-theme = true;
    gtk-can-change-accels = true;
    gtk-xft-antialias = true;
    gtk-xft-hinting = true;
    gtk-xft-hintstyle = "hintmedium";
    gtk-xft-rgba = "rgb";
    gtk-decoration-layout = "icon:minimize,maximize,close";
  };
in
{
  enable = true;
  font = {
      package = pkgs.cantarell-fonts;
      name = "Cantarell Regular";
      size = 11;
  };
  theme = {
      package = pkgs.arc-theme;
      name = "Arc-Dark";
  };
  iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
  };
  
  gtk3.extraConfig = extraConfig;
  #gtk4.extraConfig = extraConfig;
}
