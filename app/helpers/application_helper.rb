module ApplicationHelper
	def sample_helper
		"<h3> Pankaj Sample helper </h3>".html_safe
	end

	def login_helper style = ''				# added a default value '' so that if nothing is passed then this 
		if current_user.is_a?(GuestUser)	# will handle it. The empty string handles this.
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

	def nav_items
		[
			{
				url: root_path,
				title: 'Home'
			},
			{
				url: about_me_path,
				title: 'About'
			},
			{
				url: contact_path,
				title: 'Contact'
			},
			{
				url: blogs_path,
				title: 'Blog'
			},
			{
				url: portfolios_path,
				title: 'Portfolio'
			}
		]
	end

# 	def nav_helper style, tag_type
# nav_links = <<NAV
# <#{tag_type}><a href="#{root_path}" class="#{style} #{active?(root_path)}">Home</a></#{tag_type}>
# <#{tag_type}><a href="#{about_me_path}" class="#{style} #{active?(about_me_path)}">About</a></#{tag_type}>
# <#{tag_type}><a href="#{contact_path}" class="#{style} #{active?(contact_path)}">Contact</a></#{tag_type}>
# <#{tag_type}><a href="#{blogs_path}" class="#{style} #{active?(blogs_path)}">Blog</a></#{tag_type}>
# <#{tag_type}><a href="#{portfolios_path}" class="#{style} #{active?(portfolios_path)}">Portfolio</a></#{tag_type}>
# NAV
# 	nav_links.html_safe
# 	end

	def nav_helper style, tag_type
		nav_links = ''

		nav_items.each do |item|
			nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active?(item[:url])}'>#{item[:title]}</a></#{tag_type}>"
		end
		nav_links.html_safe
	end


	def active?(url)
		"active" if current_page?(url)
	end
end