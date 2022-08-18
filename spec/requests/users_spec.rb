require 'rails_helper'

RSpec.describe User, type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/index' }

    it 'should be a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render \'index\' template' do
      expect(response).to render_template('index')
    end

   
