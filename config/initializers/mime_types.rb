# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

# api_mime_types = %W(
#   application/vnd.api+json
#   text/x-json
#   application/json
# )

Mime::Type.unregister :json
# Mime::Type.register 'application/vnd.api+json', :json, api_mime_types
Mime::Type.register 'application/vnd.api+json', :json

# Mime::Type.register 'application/vnd.api+json', :jsonapi
