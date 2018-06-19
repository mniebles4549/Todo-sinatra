require 'uuid'

class Todo
  @@id = UUID.new
  @@todos = [
    id: @@id.generate,
    title: 'Sinatra Rocks',
    description: 'Small but powerful'
  ]

  def self.add(item)
    item[:id] = @@id.generate
    @@todos << item
  end

  def self.all
    @@todos
  end

  def self.get(id)
    index = @@todos.index { |item| item[:id] == id }
    @@todos[index]
  end

  def self.update(id, attrs)
       index = @@todos.index { |item| item[:id] == id }
        @@todos[index].merge!(attrs)
      end

      def self.delete(id)
           index = @@todos.index { |item| item[:id] == id }
            @@todos.delete_at(index)
      end

end
