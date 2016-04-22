require 'rails_helper'

RSpec.describe Participant::UsersController do
  describe "POST #create" do
    context "when user is saved" do
      xit "sets the user in a session and redirects them to their dashboard" do
        response = auth_response
        post :create, auth: response

        expect(response).to redirect_to dashboard_path
        expect(controller).to eq user
      end
    end
  end
end
