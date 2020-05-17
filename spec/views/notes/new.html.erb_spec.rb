require 'rails_helper'

RSpec.describe "notes/new", type: :view do
  before(:each) do
    assign(:note, Note.new(
      title: "MyString",
      description: "MyString",
      user: ""
    ))
  end

  it "renders new note form" do
    render

    assert_select "form[action=?][method=?]", notes_path, "post" do

      assert_select "input[name=?]", "note[title]"

      assert_select "input[name=?]", "note[description]"

      assert_select "input[name=?]", "note[user]"
    end
  end
end
