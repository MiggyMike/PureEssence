class SimplePagesController < ApplicationController
 def index
 end
end

class SimplePagesController < ApplicationController
  def landing_page
    @featured_product = Product.first
  end
end
