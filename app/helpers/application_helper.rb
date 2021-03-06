module ApplicationHelper
    def login_helper style = ''
     if current_user.is_a?(GuestUser) 
         (link_to "Sign Up", new_user_registration_path, class: style) + " ".html_safe +
         (link_to "Login", new_user_session_path, class: style)
     else
         link_to "Logout", destroy_user_session_path, method: :delete, class: style 
     end 
    end
    
    def sample_helper
      content_tag(:div, "My content", class: "my-class") 
    end
    
   def source_helper(styles)
    if session[:source]
        greeting = "Thanks for visiting me from #{session[:source]}, If you need top quality work done go ahead and #{ link_to 'contact me', contact_path } and lets get to work."
        content_tag(:div, greeting.html_safe, class: styles)
    end
   end
   
   
   def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
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
      },
      {
        url: tech_news_path,
        title: ' Swift News'
      },
    ]
   end
   
   def nav_helper style, tag_type 
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    
    nav_links.html_safe
   end


   
   def active? path
       "active" if current_page? path
   end
   
   def alerts
       anlert = (flash[:alert] || flash[:error] || flash[:notice])
       
       if anlert
          alert_generator anlert
       end
   end
   
   def alert_generator msg 
      js add_gritter(msg, title: "Max Nelson Portfolio", sticky: false, time: 3000) 
   end
end
