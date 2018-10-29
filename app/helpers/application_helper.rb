# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(key)
    case key
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    else "alert alert-info"
    end
  end
end
