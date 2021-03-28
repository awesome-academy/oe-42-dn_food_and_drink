class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ItemsHelper
  include DetailOrdersHelper
  include CartsHelper

  before_action :current_cart
end
