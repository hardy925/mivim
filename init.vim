" Validate and source init.plugins.vim
if filereadable(expand("~/.config/nvim/init.plugins.vim"))
  source ~/.config/nvim/init.plugins.vim
else
  echo "Plugin configuration file not found."
endif

" Validate and source init.coc.vim
if filereadable(expand("~/.config/nvim/init.coc.vim"))
  source ~/.config/nvim/init.coc.vim
else
  echo "Coc configuration file not found"
endif

" Validate and source init.settings.vim
if filereadable(expand("~/.config/nvim/init.settings.vim"))
  source ~/.config/nvim/init.settings.vim
else
  echo "Settings configuration file not found."
endif
