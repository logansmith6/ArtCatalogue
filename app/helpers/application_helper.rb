module ApplicationHelper
    def alert_class(flash_type)
        case flash_type.to_sym
        when :notice
            "alrt-success"
        when :alert
            "alert-warning"
        when :error
            "alert-danger"
        end  
    end
end
