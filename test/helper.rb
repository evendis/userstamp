require 'rubygems'

$LOAD_PATH.unshift('lib')

# load normal stuff
require 'mongoid'
require 'active_support'
require 'action_controller'
require 'init'

# connect to db
Mongoid.configure do |config|
  name = "userstamp_testing"
  config.master = Mongo::Connection.new.db(name)
  config.persist_in_safe_mode = false
end

# load test framework
require 'test/unit'
begin
  require 'redgreen'
rescue LoadError
end
require 'active_support/test_case'
require 'action_controller/test_case'
require 'action_controller/test_process'
require 'action_controller/integration'

# load test models/controllers
require 'test/controllers/userstamp_controller'
require 'test/controllers/users_controller'
require 'test/controllers/posts_controller'
require 'test/models/user'
require 'test/models/person'
require 'test/models/post'
require 'test/models/foo'

ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/:action/:id'
end

def reset_to_defaults
  Ddb::Userstamp.compatibility_mode = false
  create_test_models
end

def create_test_models
  User.delete_all
  Person.delete_all
  Post.delete_all

  @zeus = User.create!(:name => 'Zeus')
  @hera = User.create!(:name => 'Hera')
  User.stamper = @zeus.id

  @delynn = Person.create!(:name => 'Delynn')
  @nicole = Person.create!(:name => 'Nicole')
  Person.stamper = @delynn.id

  @first_post = Post.create!(:title => 'a title')
end