{ config, pkgs, ...}:
let
  link = config.lib.file.mkOutOfStoreSymlink;
  ccryptor-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "ccryptor.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "kurotych";
        repo = "ccryptor.nvim";
        rev = "4b2cd7fbf54eb8385d023b7411be4a46ab0eded8";
        hash = "sha256-CUjM8cr+SbgSd+NFbHysxogbq0QPJ/pXdSGo4p5AuHo=";
      };
    };

in
{
  programs.ripgrep.enable = true;
  programs.fzf.enable = true;
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      gruvbox # theme
      vim-nix # nix language
      vim-lsp # lsp
      telescope-nvim # fuzzy finder
      copilot-vim # copilot
      oil-nvim # OIL file manager, view link for help https://github.com/stevearc/oil.nvim?tab=readme-ov-file
      lazygit-nvim # git support 

      glow-nvim # markdown preview
      markdown-preview-nvim # markdown preview ... seems to be ok but can't use unless running X11 server

      # tmux navigator, depends on tmux plugin in config
      vim-tmux-navigator

      vim-commentary # comment out lines

      ccryptor-nvim

      vim-markdown
    ];
  };
  home.file.".config/nvim/init.lua" = { 
    enable = true;
    source = link ./nvim.lua;
  };
}
