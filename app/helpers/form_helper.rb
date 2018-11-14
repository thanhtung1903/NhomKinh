# frozen_string_literal: true

module FormHelper
  def errors_for form, field, full_error_message: true
    message = if full_error_message
                form.object.errors.full_messages_for(field).first
              else
                form.object.errors.messages[field].first
              end

    content_tag :span, message, class: "help-block #{field}" if message.present?
  end
end
