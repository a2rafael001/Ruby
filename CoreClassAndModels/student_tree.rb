class StudentTree
  include Enumerable

  attr_reader :root

  def initialize
    @root = nil
  end

  # Вставка объекта Student в дерево.
  def insert(student)
    raise ArgumentError, "Объект не является студентом" unless student.is_a?(Student)
    @root = insert_node(@root, student)
  end

  # Реализация метода each для перебора элементов дерева в порядке in-order.
  def each(&block)
    traverse_in_order(@root, &block)
  end

  private

  # Рекурсивный метод вставки нового узла.
  def insert_node(node, student)
    if node.nil?
      return Node.new(student)
    end

    if student.birth_date < node.student.birth_date
      node.left = insert_node(node.left, student)
    else
      node.right = insert_node(node.right, student)
    end
    node
  end

  # Рекурсивный обход дерева в in-order.
  def traverse_in_order(node, &block)
    return if node.nil?
    traverse_in_order(node.left, &block)
    yield node.student
    traverse_in_order(node.right, &block)
  end

  # Внутренний класс узла дерева.
  class Node
    attr_accessor :student, :left, :right

    def initialize(student)
      @student = student
      @left = nil
      @right = nil
    end
  end
end