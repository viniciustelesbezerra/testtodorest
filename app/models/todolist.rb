class Todolist
  include Mongoid::Document
  field :description, type: String
  field :priority, type: Integer
  embedded_in :user
end