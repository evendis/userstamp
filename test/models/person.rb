class Person
  include Mongoid::Document
  include Ddb::Userstamp::Stamper
  model_stamper
end