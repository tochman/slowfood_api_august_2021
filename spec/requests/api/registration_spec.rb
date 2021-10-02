RSpec.describe "POST /api/auth/" do
  describe "with successfull registration" do
    before do
      post "/api/auth/",
           params: {
             email: "user@email.com",
             password: "password",
             password_confirmation: "password",
             confirm_success_url: "placeholder",
           }
    end

    it "is expected to return a 200 response status" do
      expect(response).to have_http_status 200
    end

    it "is expected to return an access token to the user" do
      expect(response.header["access-token"]).not_to eq nil
    end

    it "is expected to that users databse contains new user" do
      expect(User.all.first.email).to eq "user@email.com"
    end
  end

  describe "with unsuccessfull registration" do
    before do
      post "/api/auth/",
           params: {
             email: "user@email.com",
             password: "password",
             password_confirmation: "wrong password",
             confirm_success_url: "placeholder",
           }
    end

    it "is expected to return an error message when password dont match" do
      expect(response_json["errors"]["full_messages"]).to eq ["Password confirmation doesn't match Password"]
    end
  end
end
