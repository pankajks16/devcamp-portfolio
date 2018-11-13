module ApplicationHelper
	def sample_helper
		"<h3> Pankaj Sample helper </h3>".html_safe
	end

	def login_helper style
		if current_user.is_a?(GuestUser)
	      	(link_to "Register", new_user_registration_path, class: style) + " ".html_safe + 
	      	(link_to "Login", new_user_session_path, class: style)
	    else
	      	(link_to "Edit Profile", edit_user_registration_path, class: style) + " ".html_safe + 
	      	(link_to "Logout", destroy_user_session_path, method: :delete, class: style)
	    end
	end

	def source_helper
		if session[:source]
			msg = "Thanks for visiting us from <b><i>#{session[:source]}</i></b>".html_safe
			content_tag(:p, msg, class: "demo-class")
		end
	end

	def copyright_generator
		PkFootTool::Renderer.copyright("Pankaj Kumar Singh", "All Rights Reserved")
	end
end
