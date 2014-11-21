Dir.foreach('post-temp') do |item|
  next if item == '.' or item == '..'

  text = File.read('post-temp/' + item)
  new_contents = text.gsub("http://devahoy.com/wp-content/uploads", "/images")

  File.open('post-temp/' + item, "w") {|file| file.puts new_contents }
end