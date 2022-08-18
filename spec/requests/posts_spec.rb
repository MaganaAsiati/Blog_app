require 'rails_helper'

RSpec.describe Post, type: :request do
  describe 'GET #index' do
  before(:example) {get '/posts/index'}

    it 'should be a success' do 
      expect(response).to have_http_status(:ok)
    end

    it 'should render \'index\' template' do
      expect(response).to render_template('index')
    end

    