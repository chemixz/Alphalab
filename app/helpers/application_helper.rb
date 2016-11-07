module ApplicationHelper


	def aside_link_to(text, url, options = {})
		if current_page?(url)
			options[:class] ||= ""
			options[:class] += "list-group-item active"
			options[:class].strip!
		else	
			options[:class] ||= ""
			options[:class] += " list-group-item"
			options[:class].strip!
		end
	    link_to text, url, options
	  
	end	


	def sidebar_link_to(text, path)
	  class_name = current_page?(path) ? 'active' : ''

	  content_tag(:li, class: class_name) do
	    link_to text, path
	  end
	end


end
