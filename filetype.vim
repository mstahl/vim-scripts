" Custom filetypes
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.cir setfiletype spice     " SPICE electronics simulator circuit file
  au! BufRead,BufNewFile *.ino setfiletype cpp       " Arduino source code
  au! BufRead,BufNewFile *.markerb setfiletype eruby " MarkERB templates
  au! BufRead,BufNewFile *.yml setfiletype yaml      " YAML files
  au! BufRead,BufNewFile *.md setfiletype markdown   " Markdown files
  au! BufRead,BufNewFile *.rs setfiletype rust       " Rust source code
augroup END
