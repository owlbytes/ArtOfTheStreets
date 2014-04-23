require "spec_helper"

describe "user upvotes post" do 
    
  let!(:user) { FactoryGirl.create(:user)}
  let!(:post) { FactoryGirl.create(:post)}

  before do
    post.user = user
    post.save
    login_with(user.email, user.password)
  end

  it "lets the user upvote a post" do
    visit(post_path(post))

    click_link("Up")

    expect(page).to have_content("Thank you for voting")

  end 
 

end 