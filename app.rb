require('sinatra')
  require('sinatra/reloader')
  also_reload('lib/**/*.rb')
  require('./lib/word')
  require('./lib/definition')

  get('/') do
    @words = Word.all()
    erb(:index)
  end

  get('/word/:id') do
    @word = Word.find(Integer(params.fetch('id')))
    erb(:word)
  end

  get ('/new_word') do
    erb(:new_word)
  end

  post ('/word') do
    word=Word.new(params.fetch('word'))
    word.save()
    erb(:success)
  end

  get ('/:id/new_definition') do
    @word = Word.find(Integer(params.fetch('id')))
    erb(:new_definition)
  end

  post ('/definition') do
    definition = Definition.new(params.fetch('definition'))
    word = Word.find(Integer(params.fetch('id')))
    word.add_def(definition)
    erb(:success)
  end
