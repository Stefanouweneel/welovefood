require 'rails_helper'

RSpec.describe "favorites/new", type: :view do
  before(:each) do
    assign(:favorite, Favorite.new(
      :post => nil,
      :user => nil
    ))
  end

  it "renders new favorite form" do
    render

    assert_select "form[action=?][method=?]", favorites_path, "post" do

      assert_select "input#favorite_post_id[name=?]", "favorite[post_id]"

      assert_select "input#favorite_user_id[name=?]", "favorite[user_id]"
    end
  end
end
