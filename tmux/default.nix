# tmx
{ config, pkgs, ...}:
let
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = [
    pkgs.tmux
  ];

  home.file.".config/tmux/tmux.conf" = { 
    enable = true;
    source = link ./tmux.conf;
  };
}
