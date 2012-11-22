class Product < ActiveRecord::Base
	# attr_accessible :title, :description, :image_url, :price
  # default_scope :order => 'title'
  has_many :line_items

  def hello
    puts "a"
    binding.pry
    puts "b"
  end

  before_destroy :ensure_not_referenced_by_any_line_item
  private
  def ensure_not_referenced_by_any_line_item
  	if line_items.empty?
  		return true
  	else
  		errors.add(:base, 'Line Items present')
  		return false
  	end
   end  
end
