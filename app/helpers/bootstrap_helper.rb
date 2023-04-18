# frozen_string_literal: true

module BootstrapHelper
  def bootstrap_class_for(flash_type)
    {
      success: "success",
      error: "danger",
      alert: "warning",
      notice: "primary"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
