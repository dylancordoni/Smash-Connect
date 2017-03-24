get '/' do
  @fests = Fest.all
  erb :'index'
end
