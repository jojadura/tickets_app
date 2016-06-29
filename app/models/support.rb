# == Schema Information
#
# Table name: supports
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :text
#  category_id    :integer
#  subcategory_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Support < ActiveRecord::Base
   belongs_to :subCategory, :class_name=> "SubCategory",
                          :foreign_key=> "sub_categories_id"
  belongs_to :user
  belongs_to :state
  belongs_to :priority
  validates :title, :description,:sub_categories_id, :priority_id, presence: {message: "es requerido"} 
  mount_uploader :screen, ScreenUploader
  

  after_initialize :set_default_state, :if => :new_record?

  def set_default_state
    self.state_id ||= State.abierto.id
  end

 def close
   self.state_id = State.finalizado.id 
   self.save
 end

 def pre_close
   self.state_id = State.pre_finalizado.id 
   self.save
 end
 def pending
   self.state_id = State.pendiente.id 
   self.save
 end

 def category_id
   return self.subCategory.category.id unless self.subCategory.nil?
 end

 def self.search(search)
  if search
    where("title LIKE ?", "%#{search}%")
  else
    all
  end
 end


end

