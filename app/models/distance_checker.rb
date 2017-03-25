class DistanceChecker
  include HTTParty
  base_uri 'http://maps.googleapis.com'
  def initialize(origin, destination)
    @api_key = ENV['GOOGLE_MAPS_KEY']
    @options = { query: {origin: origin, destination: destination, api_key: @api_key}}
  end

  def distance
    response = self.class.get("/maps/api/distance/json", @options)

  end
end
