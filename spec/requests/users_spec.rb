require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    subject { get(users_path) }
    before do
      create_list(:user, 3)
    end

    it "ユーザーの一覧が取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(res.size).to eq 3
      expect(res[0].keys).to eq ["account", "name",  "email"]
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /users/:id" do
    subject { get(user_path(user_id))}

    context "指定したidのユーザーが存在する" do
      let(:user) { create(:user) }
      let(:user_id) { user.id }

      it "ユーザーのレコードが取得できる" do
        subject
        res = JSON.parse(response.body)
        expect(response).to have_http_status(200)

        expect(res["account"]).to eq user.account
        expect(res["name"]).to eq user.name
        expect(res["email"]).to eq user.email
      end
    end
    context "指定したidのユーザーが存在しない" do
      let(:user_id) { 10000 }

      it "ユーザーのレコードが取得できない" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "POST /users" do
    subject { post(users_path, params: params) }
    let(:params) { { user: attributes_for(:user) } }

    it "ユーザーのレコードが作成できる" do
      expect { subject }.to change { User.count }.by(1)
    end
  end

  describe "PATCH /users/:id" do
    subject { patch(user_path(user.id), params: params)}
    let(:params) { { user: { name: Faker::Name.name, created_at: Time.current } }}
    let(:user) { create(:user) }

    it "任意のユーザーのレコードを更新できる" do
      expect { subject }.to change{ User.find(user.id).name }.from(user.name).to(params[:user][:name])
      expect {subject}.not_to change{User.find(user.id).account}
      expect {subject}.not_to change{User.find(user.id).name}
      expect {subject}.not_to change{User.find(user.id).created_at}
      expect(response).to have_http_status(204)
    end
  end

  describe "DELETE /users/:id" do
    subject {delete(user_path(user.id))}
    let!(:user) {create(:user)}
    it "任意のユーザーのレコードを削除できる" do
      expect { subject }.to change {User.count}.by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
