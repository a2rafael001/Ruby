# main.rb

require_relative 'html_tree'

html = <<~HTML
  <html>
    <head>
      <title>Test</title>
    </head>
    <body>
      <div class="content">
        <p>Paragraph</p>
        <img src="image.jpg" />
      </div>
    </body>
  </html>
HTML

# Создаём дерево из HTML-строки
tree = HtmlTree.new(html)

puts "Обход в глубину (depth-first traversal):"
tree.each do |node|
  puts node.to_s
  puts "  get_string: #{node.get_string}"
  puts "  get_number: #{node.get_number}"
  puts "  get_boolean: #{node.get_boolean}"
end

puts "\nОбход в ширину (breadth-first traversal):"
tree.each_breadth do |node|
  puts node.to_s
end
