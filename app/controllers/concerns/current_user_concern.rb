


module CurrentUserConcern
    extend ActiveSupport::Concern
        #override current_user method
    def current_user
        #we want current_user to be available when no on is logged in
        super || guest_user
    end
    
    def guest_user
        OpenStruct.new(name: "Guest User",
                       first_name: "Guest",
                       last_name: "User",
                       email: "guest@example.com"
                       )
    end
end