" Start the list of vim plugins
call plug#begin("~/.config/nvim/plugged")

" Adds the ability to close all except the current buffer
Plug 'vim-scripts/BufOnly.vim'

" Download a better colorscheme
Plug 'crusoexia/vim-monokai'
Plug 'jacoborus/tender.vim'

" Better file system browser
Plug 'scrooloose/nerdtree'

" Nerdtree git support!
Plug 'Xuyuanp/nerdtree-git-plugin'

" Allows you to run git commands from vim
Plug 'tpope/vim-fugitive'

" Github integration
Plug 'tpope/vim-rhubarb'

" Fuzzy file name searcher
Plug 'kien/ctrlp.vim'

" plugin for the tab and status bar
Plug 'vim-airline/vim-airline'

" Download powerline theme for the statusbar.
Plug 'vim-airline/vim-airline-themes'

" Git commit browser
Plug 'junegunn/gv.vim'

" Dims code.
Plug 'junegunn/limelight.vim'

" Minimalist mode.
Plug 'junegunn/goyo.vim'

" Better javascript indentation
Plug 'pangloss/vim-javascript'

" Add HTML5 support, also enables web components support.
Plug 'othree/html5.vim'

" Syntax support for editing markdown files.
" Plug 'tpope/vim-markdown'

" Graphql support
Plug 'jparise/vim-graphql'

" Typescript support
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" DOM typescript support
Plug 'HerringtonDarkholme/yats.vim'

" like gitlens for vscode
Plug 'APZelos/blamer.nvim'

" conqure of command
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" easier comments
Plug 'numToStr/Comment.nvim'

" better scrolling visuals
Plug 'karb94/neoscroll.nvim'

" code folding
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'

" paste images
Plug 'hakonharnes/img-clip.nvim'

" Deps
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'

" Optional deps
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'

" Yay, pass source=true if you want to build from source
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
" End the list of vim plugins
call plug#end()

" from the docs
autocmd! User avante.nvim

" run any plugin setup after calling plug#end()
lua << EOF
	-- Helper: safely require a module
	local function safe_require(name)
	  local ok, mod = pcall(require, name)
	  return ok and mod or nil
	end
	
	-- Comment.nvim setup
	local comment = safe_require("Comment")
	if comment then
	  comment.setup()
	end
	
	-- ufo setup
	local ufo = safe_require("ufo")
	if ufo then
		vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
		vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
		vim.o.fillchars = [[eob: ,fold: ,foldopen:⌄,foldsep:│,foldclose:›]]
	  ufo.setup()
	end
	
	-- render-markdown.nvim setup
	local render = safe_require("render-markdown")
	if render then
	  render.setup({
	    file_types = { "markdown", "norg", "rmd", "org", "vimwiki", "Avante" },
	    latex = { enabled = false },
	  })
	end
	
	-- nvim-treesitter setup
	local ts = safe_require("nvim-treesitter.configs")
	if ts then
	  ts.setup({
	    ensure_installed = "all",
	    sync_install = false,
	    auto_install = true,
	    highlight = {
	      enable = true,
	      additional_vim_regex_highlighting = false,
	    },
	  })
	end
	
	-- avante.nvim setup
	local avante = safe_require("avante")
	if avante then
	  avante.setup({
	    provider = "copilot",
	  })
	end
EOF

