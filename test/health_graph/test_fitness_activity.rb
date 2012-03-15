require 'helper'

class TestFitnessActivity < Test::Unit::TestCase
    context "building a FitnessActivity from an ID" do
      setup do
        stub_request(:get, HealthGraph.endpoint + '/fitnessActivities/52367938')
        .with(:header => {'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:fitness_activity]})
        .to_return(:status => 200, :body => fixture('fitness_activity.json'))
      end
      
      should "make request to api" do
         activity = HealthGraph::FitnessActivity.new(TEST_USER_TOKEN, "52367938")
          assert_requested :get,  HealthGraph.endpoint + '/fitnessActivities/52367938', :header => {'Authorization' => 'Bearer ' + TEST_USER_TOKEN, 'Accept' => HealthGraph.accept_headers[:fitness_activity]}, :times => 1
      end
      
      should "get the same URI that was used to access it" do
        activity = HealthGraph::FitnessActivity.new(TEST_USER_TOKEN, "52367938")
        assert_equal '/fitnessActivities/52367938', activity.uri
      end 
      
      should "have a 200 status" do
        activity = HealthGraph::NewFitnessActivity.new(TEST_USER_TOKEN, "52367938")
        assert_equal 200, activity.status
      end
      
      should "have some details about the activity" do
        activity = HealthGraph::NewFitnessActivity.new(TEST_USER_TOKEN, "52367938")
        assert_equal 1983, activity.total_calories
      end
    end
end