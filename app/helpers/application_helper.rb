module ApplicationHelper
  def bootstrap_class_for flash_type
    {
      success: 'alert-success', 
      notice: 'alert-info', 
      danger: 'alert-danger'
    } [flash_type.to_sym] || flash_type.to_s
  end
end
