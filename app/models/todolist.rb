class Todolist
  include Mongoid::Document
  field :description, type: String
  field :priority, type: Integer
  belongs_to :user
end
