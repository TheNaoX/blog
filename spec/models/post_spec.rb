require "rails_helper"

describe Post do
  it "contains a title" do
    post = Post.new(title: "Hello world!")

    expect(post.title).to eq "Hello!"
  end
end
