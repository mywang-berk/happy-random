noremap jk
let mapleader = ","

syntax on      " highlight syntax
set number     " show line numbers
set noswapfile " disable swapfile
set hlsearch   " highlight all results
set ignorecase " ignore case in search
set incsearch  " show search results as you type
set spelllang=en_us " highlight misspelled words

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" :TsInstall json php python
Plug 'nvim-lua/plenary.nvim'
Plug 'ccaglak/namespace.nvim'

call plug#end()

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

nmap <leader>w <Plug>(easymotion-overwin-w)
nmap <leader>s <Plug>(easymotion-s)

" define line text object
onoremap il :<c-u>normal! 0v$h<cr>
vnoremap il :<c-u>normal! 0v$h<cr>

"for namespace.nvim
nmap <leader>la <cmd>GetClasses<cr>
nmap <leader>lc <cmd>GetClass<cr>
nmap <leader>ls <cmd>ClassAs<cr>
nmap <leader>ln <cmd>Namespace<cr>

" set font
set guifont=FiraCode\ Nerd\ Font:h12

" lsp server for jumping to definitions and references
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.intelephense.setup{}
require'lspconfig'.jdtls.setup{
  cmd = { 'path_to_jdtls_folder/jdtls' }
}
require'lspconfig'.clangd.setup{}
require'lspconfig'.ocamllsp.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.tsserver.setup{}
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
EOF

