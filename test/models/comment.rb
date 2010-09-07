# this class is only meant for compatability mode testing
class Comment
  include Mongoid::Document
  include Ddb::Userstamp::Stampable

  stampable   :stamper_class_name => :person
  embedded_in  :post, :inverse_of => :comments
end