{ config, pkgs, ...}:
{
  home.file = {
    ".bashrc".source = config.lib.file.mkOutOfStoreSymlink ./bashrc;
    ".bash_profile".source = config.lib.file.mkOutOfStoreSymlink ./bashrc;
  };
}
