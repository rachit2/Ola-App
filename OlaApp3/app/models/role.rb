class Role < ApplicationRecord
	has_and_belongs_to_many :user

	#role:-
	#id type

	#role_user:-
	 # role_id user_id
end