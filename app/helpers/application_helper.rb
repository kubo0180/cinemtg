module ApplicationHelper
  def auth_tag &block
   if current_user
     capture(&block)
   end
  end
end
