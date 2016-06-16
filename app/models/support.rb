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
  belongs_to :subCategory
  belongs_to :user
  validates :title, :description,:sub_categories_id, :priority_id, presence: {message: "es requerido"} 
  mount_uploader :screen, ScreenUploader

 def category_id
   return self.subCategory.category.id unless self.subCategory.nil?
 end  
end

