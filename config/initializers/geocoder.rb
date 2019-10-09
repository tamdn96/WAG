Geocoder.configure(
  ip_lookup: :ipregistry, # for IP addresses
  timeout: 15,
  api_key: ENV['API_GEOCODING']
)
