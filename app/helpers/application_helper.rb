module ApplicationHelper
	def sample_helper
		"<h3> Pankaj Sample helper </h3>".html_safe
	end

	def login_helper
		if current_user.is_a?(User)
	      (link_to "Edit Profile", edit_user_registration_path) + "<br>".html_safe + 
	      (link_to "Logout", destroy_user_session_path, method: :delete)
	    else
	      (link_to "Register", new_user_registration_path) + "<br>".html_safe + 
	      (link_to "Login", new_user_session_path)
	    end
	end
end
