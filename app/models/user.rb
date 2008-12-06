class User
  include DataMapper::Resource
  
  property :id,     Serial
  property :login,  String
  
  default_scope(:default).update(:order => [:login.asc])
end
