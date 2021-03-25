module ItemsHelper
  def list_category
    Category.pluck(:name)
  end
end
