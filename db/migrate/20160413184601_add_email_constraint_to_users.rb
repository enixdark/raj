class AddEmailConstraintToUsers < ActiveRecord::Migration[5.0]
	def up
		execute %{
			ALTER table users add constraint email_must_be_company_email 
			check ( email ~* '^[^@]+@example\\.com' )
		}
	end

	def down
		execute %{
			ALTER TABLE
			users
			DROP CONSTRAINT
			email_must_be_company_email
		}
	end
end
