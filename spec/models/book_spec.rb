require 'spec_helper'

describe Book do
  context '正常に登録できること' do
    subject do
      Book.create(title: '銀河英雄伝説1', author: '田中芳樹', published_at: Date.new(1980, 2, 10))
    end
    it do
      expect(subject.title).to eq '銀河英雄伝説111'
      expect(subject.author).to eq '田中芳樹'
      expect(subject.published_at).to eq Date.new(1980, 2, 10)
    end
  end

  context '論理削除できること' do
    let(:book){ Book.create(title: '銀河英雄伝説1', author: '田中芳樹', published_at: Date.new(1980, 2, 10)) }
    before do
      book.destroy
    end
    context '通常では削除されていること' do
      subject{ Book.all.size }
      it{ should == 0 }
    end
    context 'with_deletedでは存在すること' do
      subject{ Book.with_deleted.all.size }
      it{ should == 1 }
    end
  end

  context '必須入力のチェック' do
    it{ should validate_presence_of(:title) }
    it{ should validate_presence_of(:author) }
  end

  context '最大長のチェック' do
    it{ should ensure_length_of(:title).is_at_most(200) }
    it{ should ensure_length_of(:author).is_at_most(200) }
  end

end