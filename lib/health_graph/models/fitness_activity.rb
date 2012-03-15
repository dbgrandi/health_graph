module HealthGraph
  class FitnessActivity
    include Model
    
    hash_attr_accessor :uri, :userID, :type, :start_time, :total_distance, :duration, :total_calories, :activity, :previous, :next
    
    def initialize access_token, activity_uri
      self.access_token = access_token
      response = get activity_uri, HealthGraph.accept_headers[:fitness_activity]
      self.body = response.body
      populate_from_hash! self.body
    end
    
  end
end