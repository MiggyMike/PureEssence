class SimplePagesController < ApplicationController
 def index
 end

 def landing_page
   @products = Product.limit(5)
 end

end
