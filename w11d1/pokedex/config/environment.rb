# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#camel
Jbuilder.key_format camelize: :lower