module ApplicationHelper

	def flash_class(type)
		case type
		when :alert
			"alert-error"
			:notice
			"alert-success"
		else
			""
		end
	end

end
