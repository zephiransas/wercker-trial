require 'spec_helper'

describe Book do
  context '正常に登録できること' do
    subject do
      Book.create(title: '銀河英雄伝説1', author: '田中芳樹', published_at: Date.new(1980, 2, 10))
    end
    it do
      expect(subject.title).to eq '銀河英雄伝説1'
      expect(subject.author).to eq '田中芳樹'
      expect(subject.published_at).to eq Date.new(1980, 2, 10)
    end
  end
end