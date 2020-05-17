require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
    assign(:notes, [
      Note.create!(
        title: "Title",
        description: "Description",
      ),
      Note.create!(
        title: "Title",
        description: "Description",
      )
    ])
  end

  it "renders a list of notes" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
