" Custom filetypes
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.cir setfiletype spice     " SPICE electronics simulator circuit file
  au! BufRead,BufNewFile *.ino setfiletype cpp       " Arduino source code
  au! BufRead,BufNewFile *.markerb setfiletype eruby " MarkERB templates
  au! BufRead,BufNewFile *.yml setfiletype yaml      " YAML files
augroup END
