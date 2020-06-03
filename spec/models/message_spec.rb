require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'can save' do
      # 1. commentが存在すれば登録できること
      it "is valid with comment" do
        message = build(:message, image: nil)
        expect(message).to be_valid
      end
      # 2. imageが存在すれば登録できること
      it "is valid with image" do
        message = build(:message, comment: nil)
        expect(message).to be_valid
      end
      # 3. comment, imageが存在すれば登録できること
      it "is valid with a comment, image" do
        message = build(:message)
        expect(message).to be_valid
      end
    end

    context 'can not save' do
      # 4. comment, imageが存在しない場合、登録できないこと
      it "is invalid without comment and image" do
        message = build(:message, comment: nil, image: nil)
        message.valid?
        expect(message.errors[:comment]).to include("を入力してください")
      end
      # 5. group_idが存在しない場合、登録できないこと
      it "is invalid without group_id" do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end
      # 6. user_idが存在しない場合、登録できないこと
      it "is invalid without user_id, image" do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end
end
