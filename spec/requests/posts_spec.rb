# frozen_string_literal: true

require 'rails_helper'

describe '/posts', type: :request do
  let(:valid_attributes) do
    {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph
    }
  end

  let(:invalid_attributes) do
    {
      title: '',
      body: ''
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Post.create! valid_attributes
      get posts_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      post = Post.create! valid_attributes
      get post_url(post), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Post' do
        expect do
          post posts_url,
               params: { post: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Post, :count).by(1)
      end

      it 'renders a JSON response with the new post' do
        post posts_url,
             params: { post: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Post' do
        expect do
          post posts_url,
               params: { post: invalid_attributes }, as: :json
        end.to change(Post, :count).by(0)
      end

      it 'renders a JSON response with errors for the new post' do
        post posts_url,
             params: { post: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          title: 'new title',
          body: 'new body'
        }
      end

      it 'updates the requested post' do
        post = Post.create! valid_attributes
        patch post_url(post),
              params: { post: new_attributes }, headers: valid_headers, as: :json
        post.reload

        expect(response.parsed_body['title']).to eq 'new title'
        expect(response.parsed_body['body']).to eq 'new body'
      end

      it 'renders a JSON response with the post' do
        post = Post.create! valid_attributes
        patch post_url(post),
              params: { post: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the post' do
        post = Post.create! valid_attributes
        patch post_url(post),
              params: { post: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested post' do
      post = Post.create! valid_attributes
      expect do
        delete post_url(post), headers: valid_headers, as: :json
      end.to change(Post, :count).by(-1)
    end
  end
end
