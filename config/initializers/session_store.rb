# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_styley_session',
  :secret      => '6db5acfe46606dce84ba0e22c5a1ab5a8987caf742f483b0d10297907fa2ea0c23673b0914be1162792d485d308b6ce590cad73c4dfb84ade8f83174b3ce7bca'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
