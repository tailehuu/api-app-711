# frozen_string_literal: true

require 'rails_helper'

describe Post do
  describe '#valid?' do
    let(:title) { 'title' }
    let(:body) { 'body' }

    subject { build(:post, title:, body:) }

    it 'returns true' do
      expect(subject.valid?).to eq true
    end

    context 'title is empty' do
      let(:title) { '' }
      let(:errors) { ["can't be blank"] }

      it 'returns error' do
        expect(subject.valid?).to eq false
        expect(subject.errors[:title]).to eq errors
      end
    end
  end
end
