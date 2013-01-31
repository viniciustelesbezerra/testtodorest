require 'spec_helper'

describe "todolists/new" do
  before(:each) do
    assign(:todolist, stub_model(Todolist,
      :description => "MyString",
      :user => nil,
      :priority => 1
    ).as_new_record)
  end

  it "renders new todolist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => todolists_path, :method => "post" do
      assert_select "input#todolist_description", :name => "todolist[description]"
      assert_select "input#todolist_user", :name => "todolist[user]"
      assert_select "input#todolist_priority", :name => "todolist[priority]"
    end
  end
end