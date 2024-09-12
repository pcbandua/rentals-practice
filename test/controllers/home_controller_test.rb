require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
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
      post "/homes.json", params: { description: "big house", year_built: 1999, square_feet: 4230, bedrooms: 3, floors: "carpet", availability: "sold", address: "450 deng ave, Nashville, TN", price: 450000 }
    end
  end

  test "show" do
    get "/home/#{Home.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["description", "year_built", "square_feet", "bedrooms", "floors", "availability", "address", "price"]
  end

  test "update" do
    home = Home.first
    patch "/homes/#{home.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  # create_table "homes", force: :cascade do |t|
  #   t.string "description"
  #   t.integer "year_built"
  #   t.integer "square_feet"
  #   t.integer "bedrooms"
  #   t.integer "bathrooms"
  #   t.string "floors"
  #   t.string "availability"
  #   t.string "address"
  #   t.integer "price"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
end
