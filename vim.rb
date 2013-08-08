def headerify()
  line        = VIM::Buffer.current.line
  line_number = VIM::Buffer.current.line_number

  VIM::Buffer.current.line = VIM::Buffer.current.line.gsub(/([^\s]+.*)/, '# \1') + " " + ("-" * (80 - line.length - 3))
  VIM::Buffer.current.append(line_number, "")
  VIM::Window.current.cursor = [line_number + 1, VIM::Window.current.cursor[1]]
end
