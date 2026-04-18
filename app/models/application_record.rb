class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def error_messages
    attr_messages = {}
    errors.messages.each do |attr, messages|
      attr_messages[attr] = messages.map do |message|
        errors.full_message attr, message
      end
    end
    attr_messages
  end
end
