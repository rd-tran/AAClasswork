require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:user) { User.create(
    username: 'asdf',
    email: 'asdf@asdf.com',
    password: 'asdfasdf'
  )}

  subject(:new_goal) { Goal.create(
    title: 'new goal',
    description: 'edit me',
    user_id: user.id
  )}

  describe 'GET #new' do
    it 'should render the new template' do
      get :new
      expect(response).to render_template(:new)
      expect(response).to have_http_status 200
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'should create a new goal' do
        post :create, params: {
          title: 'goal',
          description: 'goal description'
        }

        goal = Goal.find_by(title: 'goal')
        expect(goal).to be_truthy
      end

      it 'should redirect to user\'s show page' do
        post :create, params: {
          title: 'goal',
          description: 'goal description'
        }

        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'with invalid params' do
      it 'should redirect to new' do
        post :create, params: {
          title: '',
          description: ''
        }

        expect(response).to redirect_to(new_goal_path)
        expect(flash[:errors]).to be_present
      end
    end
  end

  describe 'GET #edit' do
    it 'should render the edit template' do
      get :edit
      expect(response).to render_template(:edit)
      expect(response).to have_http_status 200
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do

      before :each do
        patch :update, params: {
          id: new_goal.id,
          title: 'new goal',
          description: 'edited'
        }
      end

      it 'should update a goal' do
        goal = Goal.find_by(title: 'new goal')
        expect(goal.description).to eq('edited')
      end

      it 'should redirect to user\'s show page' do
        expect(response).to redirect_to(goal_path(goal))
      end
    end

    context 'with invalid params' do
      it 'should redirect to new' do
        patch :update, params: {
          id: new_goal.id,
          title: '',
          description: ''
        }

        expect(response).to redirect_to(new_goal_path)
        expect(flash[:errors]).to be_present
      end
    end
  end
end
