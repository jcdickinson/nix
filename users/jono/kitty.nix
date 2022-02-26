{ pkgs, ... }:
{
    enable = true;

    settings = {
        shell = "${pkgs.fish.out}/bin/fish -i -l -C 'cd $HOME'";
        window_padding_width = "0 10";
        
        font_family = "MonoLisa Nerd Font";
        font_size = "13.0";
        wheel_scroll_multiplier="25.0";
        touch_scroll_multiplier="5.0";

        background="#0e1419";
        foreground="#e5e1cf";
        cursor="#f19618";
        selection_background="#243340";
        color0="#000000";
        color8="#323232";
        color1="#ff3333";
        color9="#ff6565";
        color2="#b8cc52";
        color10="#e9fe83";
        color3="#e6c446";
        color11="#fff778";
        color4="#36a3d9";
        color12="#68d4ff";
        color5="#f07078";
        color13="#ffa3aa";
        color6="#95e5cb";
        color14="#c7fffc";
        color7="#ffffff";
        color15="#ffffff";
        selection_foreground="#0e1419";
    };
}
