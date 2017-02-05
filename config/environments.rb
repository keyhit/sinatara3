#config for development
configure :development do 
  set :database, { adapter: 'postgresql',
                   encoding: 'unicode',
                   database: 'sinatra3_dev1',
                   pool: 2,
                   username: 'postgres'
                 }
end