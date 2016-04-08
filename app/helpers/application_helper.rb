module ApplicationHelper
  def active_tab(*controller_names, closed)
    controller_names.include?(controller.controller_name.to_sym) && params[:closed] == closed ? 'active' :  nil
  end
end
