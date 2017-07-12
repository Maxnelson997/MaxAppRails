module DefaultPageContent
    extend ActiveSupport::Concern
    
    included do 
        before_action :set_title
    end
    
  def set_title
    @page_title = "Max Nelson | iOS Developer"
    @seo_keywords = "iOS Developer, swift, developer, android, code, 'experienced ios developer', 'affordable ios developer'"
  end
  
end

