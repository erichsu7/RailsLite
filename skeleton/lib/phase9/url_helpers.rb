module UrlHelpers

  def define_url_helper(controller_class, action)
    class_plural = controller_class.to_s.gsub("Controller", "").downcase
    class_single = class_plural.singularize

    case action
    when :show, :edit, :update, :destroy

    when :index, :create
      define_method("#{class_plural}_url") do
        "/#{class_plural}"
      end
    when :new
      define_method("new_#{class_single}_url") do
        "/#{class_plural}/new"
      end
    when :show, :update, :destroy
      define_method("#{class_single}_url") do |obj|
        id = obj.is_a?(Fixnum) ? obj : obj.id

        "/#{class_single}/#{id}"
      end
    when :edit
      define_method("edit_#{class_single}_url") do |obj|
        id = obj.is_a?(Fixnum) ? obj : obj.id

        "/#{class_single}/#{id}/edit"
      end
    end

  end
end


#index    /cats         cats_url
#new      /cats/new     new_cat_url
#create   /cats         cats_url

#show     /cats/1       cat_url(1 or @cat)
#edit     /cats/1/edit  edit_cat_url(1 or @cat)
#update   /cats/1       cat_url(1 or @cat)
#destroy  /cats/1       cat_url(1 or @cat)
