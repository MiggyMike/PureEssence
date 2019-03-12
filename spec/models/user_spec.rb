require 'rails_helper'

describe User do

	context "Validation testing" do

		it "is not valid with missing email address" do
			expect(User.new(first_name: "Tyler", last_name: "Lang", email: nil)).not_to be_valid
		end

		it "is not valid wiht password less then six characters" do
			expect(User.new(email: "t_lang@yahoo.com", password: "dcba")).not_to be_valid
		end
	end
end
