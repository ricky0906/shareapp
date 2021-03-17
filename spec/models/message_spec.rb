require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ投稿機能' do
    context 'メッセージの投稿が保存できないとき' do
      it 'contentとimageが空では登録できないこと' do
        @message.content = ''
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end
      it 'roomが紐づいていないと登録できないこと' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
      it 'userが紐づいてないと登録できないこと' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
    end

    context 'メッセージの投稿が保存できるとき' do
      it 'contentとimageが存在すれば登録できる' do
        expect(@message).to be_valid
      end
      it 'contentが空でも登録できる' do
        @message.content = ''
        expect(@message).to be_valid
      end
      it 'imageが空でも登録できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end
  end
end
