require "rails_helper"

describe Post do
  describe "validations" do
    it "fails to save" do
      post = Post.new

      post.save

      expect(post).to_not be_persisted
    end

    it "validates presence of body" do
      post = Post.new(title: "Foo", author: "Antonio")

      post.save

      expect(post.errors.full_messages).to eq(["Body can't be blank"])
    end

    it "validates presence of title" do
      post = Post.new(body: "Foo", author: "Antonio")

      post.save

      expect(post.errors.full_messages).to eq(["Title can't be blank"])
    end

    it "validates presence of author" do
      post = Post.new(body: "Foo", title: "Bar")

      post.save

      expect(post.errors.full_messages).to eq(["Author can't be blank"])
    end

    it "validates uniqueness of title" do
      Post.create(title: "My Title",
                  body: "Foo",
                  author: "Antonio")

      post = Post.new(title: "My Title",
                      body: "Foo",
                      author: "Antonio")

      post.save

      expect(post.errors.full_messages).to eq(["Title has already been taken"])
    end
  end
end
