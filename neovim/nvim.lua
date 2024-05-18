
vim.api.nvim_set_keymap('n', '<S-CR>', '<cmd>lua require("telescope.builtin").find_files({find_command = {"rg", "--files", "--hidden", "--follow"}})<CR><cmd>tabnew<CR>', {noremap = true})
-- vim.cmd [[source /nix/store/a5vpp4sz28wxrarbm9a4fpf46w7v3dja-nvim-init-home-manager.vim]]vim.api.nvim_set_keymap('n', '<S-CR>', '<cmd>lua require("telescope.builtin").find_files({find_command = {"rg", "--files", "--hidden", "--follow"}})<CR><cmd>tabnew<CR>', {noremap = true})
-- oil setup
require("oil").setup({
	cleanup_delay_ms = 1000,
	view_options = {
	  show_hidden = true
	}
})

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- glow setup: https://github.com/ellisonleao/glow.nvim?tab=readme-ov-file#setup
require('glow').setup({
  width = 80,
  height = 100,
  width_ratio = 1, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
  height_ratio = 1,
})

-- telescope config
require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      mirror = true,
      prompt_position = 'bottom',
      preview_height = 0.65,
      width = 0.75,
      height = 0.95,
    }
  }
})

-- ccryptor setup
require('ccryptor').setup({
  dir_path = '/home/jamesm/gitprojects/personal/personal_notes/journal/'
})

-- vim keybindings below 
vim.cmd [[
set splitbelow
set splitright

let mapleader = "\<Space>"

colorscheme gruvbox 

set noswapfile 

" turning mouse off so that I can click in and it won't move my cursor
set mouse=
" set clipboard=unnamedplus
set number relativenumber
set scrolloff=5

set nowrap
nnoremap <Leader>z :set wrap!<CR> 

" clear the highlighting from search
nnoremap <Leader><Enter> :nohlsearch<CR> " telescope


" toggle side numbers 
nnoremap <Leader>l :call ToggleSidenums()<CR>
function! ToggleSidenums()
  if &relativenumber
    set norelativenumber
  else
    set relativenumber " number " used to use number when I was hiding these 
  endif
endfunction

" toggle listchars
nnoremap <Leader>L :call ToggleListchars()<CR>
function! ToggleListchars()
  if &list
    set listchars= nolist
  else
    set list listchars=tab:>␣,trail:~,extends:>,precedes:<,space:·
  endif
endfunction

" rebind J and K to be { and } for jumping whitespace
vnoremap J }
vnoremap K {
nnoremap J }
nnoremap K {

" copy , pasting is handling by going to insert and hitting "ctrl + shift + v" 
vnoremap c "*y
vnoremap <Leader>c "*y
nnoremap <Leader>c "*y

" pasting just in case 
vnoremap <Leader>v "*p
nnoremap <Leader>v "*p

" cutting
vnoremap <Leader>x "*d
nnoremap <Leader>x "*d

" saving file
nnoremap <Leader>w :write<CR>

" closing
nnoremap <Leader>C :close<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>QQ :q!<CR>

" copilot
let g:copilot_filetypes = {
      \ '*': v:true,
      \ }

" tabs and buffers
" tab switching using ctrl + tab
nnoremap <Leader>k :tabprevious<CR>
nnoremap <Leader>j :tabnext<CR>
nnoremap <Leader>, :tabprevious<CR>
nnoremap <Leader>. :tabnext<CR>

" rebind :bprev and :bnext
nnoremap <Leader>J :bprev<CR>
nnoremap <Leader>K :bnext<CR>
 
" copilot remap autocomplete to ctrl + l
imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Telescope searching
" map <Leader>F to search for the current word under the cursor
nnoremap <Leader>F viw"0y<space>:Telescope grep_string<CR><Esc>
nnoremap <Leader>f :Telescope live_grep<CR>
nnoremap <Leader>p :Telescope find_files<CR>
nnoremap <Leader>o :Telescope oldfiles<CR><Esc>

" reload configuration
nnoremap <Leader>R :source ~/.config/nvim/init.lua<CR>

" remap ctrl + d
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

map <leader>G :LazyGit<CR>

" buffer switching like Vimium
nnoremap <Leader>b :Telescope buffers<CR><Esc>
nnoremap T :Telescope buffers<CR>
nnoremap <Leader>t :Telescope buffers<CR>

set ignorecase
set smartcase
" set incsearch, this should remain off
set noincsearch

tnoremap <Esc> <C-\><C-n>

nnoremap <Leader>m :Glow<CR>

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2


" expirimental tmux navigator
let g:tmux_navigator_no_mappings = 1
" let  g:tmux_navigator_no_wrap = 1

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>
noremap <silent> <C-/> :<C-U>TmuxNavigatePrevious<cr>
"
"
" mapping with meta 
nnoremap <M-Left> <C-w>h
nnoremap <M-Down> <C-w>j
nnoremap <M-Up> <C-w>k
nnoremap <M-Right> <C-w>l
noremap <silent> <M-Left>  :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <M-Down>  :<C-U>TmuxNavigateDown<cr>
noremap <silent> <M-Up>    :<C-U>TmuxNavigateUp<cr>
noremap <silent> <M-Right> :<C-U>TmuxNavigateRight<cr>


" bind ctrl + shift + d to insert (date +'%y%m%d - %H:%M %p') 
" nnoremap <C-D> i<C-R>=strftime("%y%m%d")<CR>
" do the same but from insert mode
inoremap <C-D> <C-R>=strftime("%y%m%d")<CR>


" plugin manager
" call plug#begin()
" Plug 'kurotych/ccryptor.nvim'

" call plug#end()
" end plugin manager
]]


-- todo for neovim | neovim todo
-- ...
-- add something to copy the current file path to the clipboard
-- - add something to fold lines 
-- make a way to get my home-manager/vim config onto servers easily without cloning the whole repo
--
-- make vim highlight the links like https:// etc in markdown docs
--
-- table of contents on demmand for a markdown file
--
-- look for a vim extension for doing media wiki text and see if I can get better closing tags? 
