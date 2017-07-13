


module CurrentUserConcern
    extend ActiveSupport::Concern
        #override current_user method
    def current_user
        #we want current_user to be available when no on is logged in
        super || guest_user
    end
    
    def guest_user
        guest = GuestUser.new
        guest.name = "Guest User"
        guest.first_name = "Guest"
        guest.last_name = "User"
        guest.email = "guest@example.com"
        guest
    end
end