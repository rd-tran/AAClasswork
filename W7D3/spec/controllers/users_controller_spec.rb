require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe 'GET #new' do
    it 'should render the new template' do
      get :new
      expect(response).to render_template(:new)
      expect(response).to have_http_status 200
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'should login the user' do
        post :create, params: {
          user: {
            username: 'asdf', email: 'asdf@asdf.gmail.com', password: 'asdfasdf'
          }
        }

        user = User.find_by(username: 'asdf')

        expect(session[:session_token]).to eq user.session_token 
      end

      it 'should redirect to user\'s show page' do
        post :create, params: {
          user: {
            username: 'asdf', email: 'asdf@asdf.gmail.com', password: 'asdfadsf'
          }
        }

        user = User.find_by(username: 'asdf')
        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'with invalid params' do
      it 'should redirect to new' do
        post :create, params: {
          user: {
            username: '', email: '', password: ''
          }
        }

        expect(response).to redirect_to(new_user_path)
        expect(flash[:errors]).to be_present
      end
    end
  end
end
