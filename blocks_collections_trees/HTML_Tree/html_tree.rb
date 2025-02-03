# html_tree.rb

require_relative 'html_tag'

class HtmlTree
  include Enumerable  # Подмешиваем модуль Enumerable

  attr_reader :root

  # При инициализации принимаем строку с HTML и строим дерево
  def initialize(html)
    @html = html
    @root = parse_html(html)
  end

  # Реализация метода each для обхода дерева в глубину (depth-first)
  def each(&block)
    return enum_for(:each) unless block_given?
    depth_first_traversal(@root, &block)
  end

  # Метод для обхода дерева в ширину (breadth-first)
  def each_breadth(&block)
    return enum_for(:each_breadth) unless block_given?
    queue = [@root]
    until queue.empty?
      node = queue.shift
      yield node
      queue.concat(node.children) if node.children
    end
  end

  private

  # Рекурсивный обход дерева в глубину
  def depth_first_traversal(node, &block)
    yield node
    node.children.each { |child| depth_first_traversal(child, &block) }
  end

  # Упрощённый парсер HTML, сохраняющий иерархию тегов
  def parse_html(html)
    # Извлекаем все теги (открывающие, закрывающие, самозакрывающие) с помощью регулярного выражения
    tokens = html.scan(/<[^>]+>/)
    stack = []  # Стек для отслеживания вложенности
    root = nil

    tokens.each do |token|
      if token.start_with?("</")
        # При закрывающем теге извлекаем последний открытый тег из стека
        if stack.empty?
          next  # Если нет открытых тегов — пропускаем
        end
        closed_tag = stack.pop
        root = closed_tag if stack.empty?
      else
        # Создаём объект Tag для открывающего или самозакрывающегося тега
        tag = parse_tag(token)
        if tag.self_closing
          # Если тег самозакрывающийся, добавляем его как дочерний к последнему тегу в стеке,
          # либо, если стек пуст — назначаем его корневым (или создаём dummy-узел, если уже есть корень)
          if stack.empty?
            if root.nil?
              root = tag
            else
              dummy = Tag.new("dummy")
              dummy.children << root
              dummy.children << tag
              root = dummy
            end
          else
            stack.last.children << tag
          end
        else
          # Если тег не самозакрывающийся, добавляем его в дочерние текущего родителя
          stack.last.children << tag if stack.any?
          # И помещаем его в стек для ожидания закрывающего тега
          stack.push(tag)
        end
      end
    end

    # Если стек не пуст, возвращаем первый элемент как корневой
    root ||= stack.first
    root
  end

  # Метод для разбора строки тега и извлечения имени и атрибутов
  def parse_tag(token)
    if token.match(/\/>$/)
      self_closing = true
      inner = token[1..-3].strip  # Убираем символы <, /> и лишние пробелы
    else
      self_closing = false
      inner = token[1..-2].strip  # Убираем символы < и >
    end

    # Разбиваем строку на имя тега и строку с атрибутами
    parts = inner.split(/\s+/, 2)
    tag_name = parts[0]
    attributes = {}

    if parts[1]
      attr_str = parts[1]
      # Извлекаем атрибуты в формате key="value"
      attr_str.scan(/(\w+)="([^"]*)"/) do |attr, value|
        attributes[attr] = value
      end
    end

    Tag.new(tag_name, attributes, self_closing)
  end
end
