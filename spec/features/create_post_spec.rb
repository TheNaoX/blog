require "rails_helper"

feature "Create post" do
  scenario "successfully" do
    visit "/"

    click_link "Crear nueva publicación"

    within "#new_post" do
      fill_in "Título", with: "My title"
      fill_in "Cuerpo", with: "My body"
      fill_in "Autor",  with: "Antonio"

      click_on "Guardar"
    end

    expect(current_path).to eq "/"
    expect(page).to have_content "My title"
  end

  scenario "unsuccessfully" do
    visit "/"

    click_link "Crear nueva publicación"

    within "#new_post" do
      click_on "Guardar"
    end

    expect(current_path).to eq "/posts"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Body can't be blank"
    expect(page).to have_content "Author can't be blank"
  end

  scenario "unsuccessfully when title is duplicated" do
    Post.create!(title: "My title", body: "My body", author: "Antonio")

    visit "/"

    click_link "Crear nueva publicación"

    within "#new_post" do
      fill_in "Título", with: "My title"
      fill_in "Cuerpo", with: "My body"
      fill_in "Autor",  with: "Antonio"

      click_on "Guardar"
    end

    expect(current_path).to eq "/posts"
    expect(page).to have_content "Title has already been taken"
  end
end
