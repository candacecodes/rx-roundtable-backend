class UserSerializer < ActiveModel::Serializer
  attributes :id, :username 

  # def rx 
  #   object.rx 
  #   gives array of all rx and puts it in the attributes 
  # end 
end
