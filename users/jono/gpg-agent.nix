{ ... }:

{
  enable = true;
  extraConfig = ''
    allow-loopback-pinentry
  '';
  pinentryFlavor = "tty";
  verbose = true;
}