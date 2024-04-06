# tmx
{ config, pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux.conf; # for now diabling this and even using the same config ... was having some issues with escape being sent to tmux to switch windows  (like an escape delay that was being ignored) 
    disableConfirmationPrompt = true;
    historyLimit = 100000;
    newSession = false;
    plugins = with pkgs.tmuxPlugins; [
      # look into "tpm"
      vim-tmux-navigator
    ];
  };
}
