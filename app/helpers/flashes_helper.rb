module FlashesHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      notice: "alert-info",
      alert: "alert-warning",
      error: "alert-danger"
    }[flash_type.to_sym] || flash_type.to_s
  end
end
