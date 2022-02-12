{ ... }:
{
  "org/gnome/desktop/background" = {
    picture-options="zoom";
    picture-uri="file:///run/current-system/sw/share/backgrounds/gnome/LightBulb.jpg";
    primary-color="#ffffff";
    secondary-color="#000000";
  };

  "org/gnome/desktop/interface" = {
    clock-show-weekday=true;
    cursor-size=32;
    cursor-theme="capitaine-cursors-white";
    enable-hot-corners=false;
    font-antialiasing="grayscale";
    font-hinting="slight";
    gtk-im-module="gtk-im-context-simple";
  };

  "org/gnome/desktop/peripherals/touchpad" = {
    speed=0.20284697508896787;
    two-finger-scrolling-enabled=true;
  };

  "org/gnome/desktop/screensaver" = {
    picture-options="zoom";
    picture-uri="file:///run/current-system/sw/share/backgrounds/gnome/LightBulb.jpg";
    primary-color="#ffffff";
    secondary-color="#000000";
  };

  "org/gnome/desktop/wm/preferences" = {
    button-layout="appmenu:minimize,close";
  };

  "org/gnome/mutter" = {
    attach-modal-dialogs=true;
    dynamic-workspaces=true;
    edge-tiling=true;
    focus-change-on-pointer-rest=true;
    workspaces-only-on-primary=true;
  };

  "org/gnome/shell" = {
    disabled-extensions=["user-theme@gnome-shell-extensions.gcampax.github.com"];
    enabled-extensions=["appindicatorsupport@rgcjonas.gmail.com" "dash-to-dock@micxgx.gmail.com"];
    favorite-apps=["org.gnome.Nautilus.desktop" "firefox.desktop" "kitty.desktop" "codium.desktop"];
    welcome-dialog-last-shown-version="41.1";
  };

  "org/gnome/settings-daemon/plugins/power" = {
    power-button-action="interactive";
  };

  "org/gnome/shell/extensions/dash-to-dock" = {
    apply-custom-theme=true;
    background-opacity=0.80000000000000004;
    dash-max-icon-size=48;
    dock-position="BOTTOM";
    height-fraction=0.90000000000000002;
    multi-monitor=true;
    preferred-monitor=0;
    preview-size-scale=0.0;
    show-mounts=false;
    show-show-apps-button=false;
    show-trash=false;
  };
}