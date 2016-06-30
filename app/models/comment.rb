class Comment < ActiveRecord::Base
  belongs_to :support
  belongs_to :user
  validates :note, presence: {message: "es requerido"} 
end
