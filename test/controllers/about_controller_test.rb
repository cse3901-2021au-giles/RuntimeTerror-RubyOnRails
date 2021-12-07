require "test_helper"

class AboutControllerTest < ActionDispatch::IntegrationTest
    test "can get about page" do
        get about_url
        assert_response :success
    end
end