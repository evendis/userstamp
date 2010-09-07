class Foo
  include Mongoid::Document
  include Ddb::Userstamp::Stampable
  stampable :deleter_attribute => :deleter_id
end