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
  context '失敗するテスト' do
    subject{ 1 }
    it{ should == 3 }
  end
end