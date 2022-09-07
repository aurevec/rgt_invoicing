Mjml.setup do |config|
  config.template_language = :slim
  config.mjml_binary = Rails.root.join("node_modules", "mjml", "bin", "mjml")
end