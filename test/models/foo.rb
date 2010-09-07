class Foo
  include Mongoid::Document
  stampable :deleter_attribute => :deleter_id
end