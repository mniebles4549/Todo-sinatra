get '/todos' do
  @todos = Todo.all
  @flash = session[:flash] ? session[:flash] : nil
  session[:flash] = nil
  
  erb :'todos/index'
end

get '/todos/create' do
  erb :'todos/create'
end

post '/todos' do
  Todo.add({
    "title": params[:title],
    "description": params[:description]
  })
  session[:flash] = 'The todo was created sucessful'
  redirect '/todos'
end

get '/todos/:id' do
  @todo = Todo.get(params[:id])
  erb :'todos/show'
end

get '/todos/:id/edit' do
  @todo = Todo.get(params[:id])
  erb :'todos/edit'
end

post '/todos/:id/update' do
  Todo.update(params[:id], {
    "title": params[:title],
    "description": params[:description]
  })
  redirect '/todos'
end

get '/todos/:id/delete' do
   Todo.delete(params[:id])
   redirect '/todos'
end