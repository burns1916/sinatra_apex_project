require './config/environment'
use Rack::Static, :root => 'public', :urls => ['/images', '/stylesheets']
  use Rack::MethodOverride
  use LegendsController 
  use StatsController  
  use UsersController   
  run ApplicationController