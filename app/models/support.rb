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

  enum encuesta: [:si,:no]                        
  belongs_to :user
  enum state: [:abierto, :pendiente, :pre_finalizado, :cerrado]
  belongs_to :priority
  has_many :comments
  validates_associated :comments
  

  validates :title, :description,:sub_categories_id, presence: {message: "es requerido"} 
  mount_uploader :screen, ScreenUploader
 
  after_create :set_priority

  def set_priority
    # DEBE SER SIEMPRE EL PRIMER REGISTO O ID MÁS BAJO
    update_attribute("priority_id", Priority.first.id)
    abierto!
  end



 def close encuesta=nil
    si! if encuesta==0
    no! if encuesta==1
    if no?
      update_attribute("re_open", DateTime.now)
      abierto!
      increment!(:re_open_count)
    else
     finalizado!
      update_attribute("date_close", DateTime.now)
    end 
 end

 def pre_close
     pre_finalizado!
     update_attribute("date_preclose",DateTime.now)
     
 end
 def pending
    pendiente!
    update_attribute("date_pending",DateTime.now)
    
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
 scope :all_order, ->(search,page,pagination){search(search).order("state, created_at DESC").page(page).per(pagination)}

 scope :all_order_infraestructure, ->(search,page,pagination){joins(:sub_categories, :categoires).search(search).order("states.order, created_at DESC").page(page).per(pagination)}


 def self.infraestructure search, page, pagination
   @category = Category.find_by(:title=>'Infraestructura')
   joins(:subCategory).where("sub_categories.category_id=#{@category.id}").search(search).order("created_at DESC").page(page).per(pagination)
 end
end

