{ config, pkgs, ...}:
{
  programs.ripgrep.enable = true;
  programs.fzf.enable = true;
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix # nix language
      vim-lsp # lsp
      telescope-nvim # fuzzy finder
      onedark-vim # theme
      copilot-vim # copilot
      oil-nvim # OIL file manager, view link for help https://github.com/stevearc/oil.nvim?tab=readme-ov-file
      lazygit-nvim # git support 
      # everything above is pretty much essential

      glow-nvim # markdown preview
      markdown-preview-nvim # markdown preview ... seems to be ok but can't use unless running linux 

      # tmux navigator
      # also depends on tmux plugin in tmux config
      vim-tmux-navigator

      vim-commentary # comment out lines
    ];
    extraConfig = builtins.readFile ./vimrc;
    extraLuaConfig = builtins.readFile ./vim.lua;
  };
}
