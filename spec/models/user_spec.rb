require 'rails_helper'
require 'support/violate_check_constraint_matcher'
RSpec.describe User do
	describe 'email' do
		let(:user) {
			User.create(email: "foo@example.com",
				password: "abcdxyz",
				password_confirmation: "abcdxyz")
		}
		it 'should prevents invalid email' do
			expect {
				user.update_attribute(:email, "abcxyz@test.com")
			}.to violate_check_constraint(:email_must_be_company_email)
			#raise_error(ActiveRecord::StatementInvalid, /email_must_be_company_email/i)
		end
	end
end