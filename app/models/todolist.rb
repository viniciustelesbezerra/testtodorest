class Todolist
  include Mongoid::Document

  field :description, type: String
  field :priority, type: Integer
  
  ####belongs_to :user
  embedded_in :user

  validates :description, :priority, :presence => true

end
