{ ... }:
{
  "org/gnome/desktop/background" = {
    picture-options="zoom";
    picture-uri="${./files/pexels-stephane-hurbe-4198029.jpg}";
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
    picture-uri="${./files/pexels-stephane-hurbe-4198029.jpg}";
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
    disable-user-extensions=false;
    disabled-extensions=["user-theme@gnome-shell-extensions.gcampax.github.com"];
    enabled-extensions=["appindicatorsupport@rgcjonas.gmail.com"];
    favorite-apps=["org.gnome.Nautilus.desktop" "firefox.desktop" "org.gnome.Terminal.desktop" "codium.desktop"];
    welcome-dialog-last-shown-version="41.1";
  };

  "org/gnome/settings-daemon/plugins/power" = {
    power-button-action="interactive";
  };

  "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
    # ayu mirage
    background-color="rgb(33,39,51)";
    bold-color-same-as-fg=true;
    cursor-background-color="rgb(67,74,88)";
    cursor-colors-set=true;
    cursor-foreground-color="rgb(255,204,102)";
    custom-command="/etc/profiles/per-user/jono/bin/fish -i -l";
    font="MonoLisa 12";
    foreground-color="rgb(217,215,206)";
    highlight-background-color="rgb(52,63,76)";
    highlight-colors-set=true;
    highlight-foreground-color="rgb(255,255,255)";
    palette=[
      "rgb(25,30,43)" 
      "rgb(237,130,116)"
      "rgb(166,204,112)" 
      "rgb(250,208,123)" 
      "rgb(109,203,250)"
      "rgb(207,186,250)"
      "rgb(144,225,198)"
      "rgb(199,199,199)"
      "rgb(104,104,104)"
      "rgb(242,135,121)"
      "rgb(186,230,126)"
      "rgb(255,213,128)"
      "rgb(115,208,255)"
      "rgb(212,191,255)"
      "rgb(149,230,203)"
      "rgb(255,255,255)"
    ];
    use-custom-command=true;
    use-system-font=false;
    use-theme-colors=false;
  };
}