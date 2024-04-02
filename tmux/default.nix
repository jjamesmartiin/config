# tmx
{ config, pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux.conf; # for now diabling this and even using the same config has some issues with escape being sent to tmux to switch windows 
    disableConfirmationPrompt = true;
    historyLimit = 100000;
    newSession = false;
    plugins = with pkgs.tmuxPlugins; [
      # look into "tpm"
      vim-tmux-navigator
    ];
  };
}
