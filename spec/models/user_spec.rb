require "rails_helper"

describe User do
  describe "#full_name" do
    it "returns the first name and last name joined" do
      user = User.create!(first_name: "Antonio",
                          last_name: "Chavez",
                          email: "cavjzz@gmail.com",
                          password: "12345678")

      expect(user.full_name).to eq "Antonio Chavez"
    end
  end
end
