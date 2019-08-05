class Address < ActiveRecord::Base
	belongs_to :user

	 def full_address
		"#{self.name},#{self.pincode} #{self.house_no},#{self.city},#{self.state} #{self.mobile_no}"
	 end
end
