get '/' do
  @todos = Todo.all
  erb :'todos/index'
end