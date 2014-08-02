I18n::Backend::Base.class_eval do
  def translate_with_default(locale, key, options = {})
    if !options.key?(:model)
      default = key.to_s.gsub('_', ' ').gsub(/\b('?[a-z])/) { $1.capitalize }
      options.reverse_merge!(default: default.split('.').last)
    end
    translate_without_default(locale, key, options)
  end

  alias_method_chain :translate, :default
end
