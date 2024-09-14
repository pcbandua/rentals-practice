require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "index" do
    get "/homes.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Home.count, data.length
  end

  test "create" do
    assert_difference "Home.count", 1 do
      post "/homes.json", params: { description: "big house", year_built: 1999, square_feet: 4230, bedrooms: 3, bathrooms: 4, floors: "carpet", availability: "sold", address: "450 deng ave, Nashville, TN", price: 450000 }
    end
  end

  test "show" do
    get "/homes/#{Home.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "description", "year_built", "square_feet", "bedrooms", "bathrooms", "floors", "availability", "address", "price"]
  end

  test "update" do
    home = Home.first
    patch "/homes/#{home.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Home.count", -1 do
      delete "/homes/#{Home.first.id}.json"
      assert_response 200
    end
  end
end
