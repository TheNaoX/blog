require "rails_helper"

describe PostsController do
  describe "GET #index" do
    it "is successful" do
      get :index

      expect(response.status).to eq 200
    end
  end

  describe "GET #new" do
    it "is successful" do
      get :new

      expect(response.status).to eq 200
    end
  end

  describe "POST #create" do
    context "when the attributes are complete" do
      it "redirects to root path" do
        post :create, post: { title: "Foo", body: "Bar", author: "Antonio" }

        expect(response).to redirect_to(root_path)
      end
    end

    context "when the attributes are incomplete" do
      it "renders the new template" do
        post :create, post: { title: nil, body: nil, author: nil }

        expect(response).to render_template("new")
      end

      it "is unprocessable entity" do
        post :create, post: { title: nil, body: nil, author: nil }

        expect(response.status).to eq 422
      end
    end
  end
end
