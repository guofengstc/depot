class Product < ActiveRecord::Base
<<<<<<< HEAD
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
=======
	attr_accessible :description, :image_url, :price, :title
	# validate :price_must_be_at_least_a_cent
	#protected
	#def price_must_be_at_least_a_cent
	# 	errors.add(:price, 'should be at least 0.01' ) if price.nil ？ || price < 0.01
	# end
	validates_format_of :image_url,
	:with => %r{\.(gif|jpg|png)$}i,
	:message => 'must be a URL for GIF, JPG or PNG image.'
end
>>>>>>> 4fc781660e5e8b56c7b22f684528dbd614cd4f3a
