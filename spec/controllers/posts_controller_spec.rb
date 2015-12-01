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

  describe "GET #edit" do
    it "is successful" do
      p = Post.create!(title: "Foo", body: "Bar", author: "Antonio")

      get :edit, id: p.id

      expect(response.status).to eq 200
    end

    it "is not found" do
      get :edit, id: 1

      expect(response.status).to eq 404
    end
  end

  describe "PUT #update" do
    it "redirects to root path" do
      p = Post.create!(title: "Foo", body: "Bar", author: "Antonio")

      put :update, id: p.id, post: { title: "Foo2" }

      expect(response).to redirect_to(root_path)
    end

    context "when the attributes are invalid" do
      it "renders the edit view" do
        p = Post.create!(title: "Foo", body: "Bar", author: "Antonio")

        put :update, id: p.id, post: { title: nil }

        expect(response).to render_template("edit")
      end

      it "renders the edit view" do
        p = Post.create!(title: "Foo", body: "Bar", author: "Antonio")

        put :update, id: p.id, post: { title: nil }

        expect(response.status).to eq 422
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to root path" do
      p = Post.create!(title: "Foo", body: "Bar", author: "Antonio")

      delete :destroy, id: p.id

      expect(response).to redirect_to(root_path)
    end

    it "redirects returns an exception" do
      delete :destroy, id: 1

      expect(response.status).to eq 404
    end
  end
end
