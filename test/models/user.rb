class User
  include Mongoid::Document
  include Ddb::Userstamp::Stamper
  model_stamper
end