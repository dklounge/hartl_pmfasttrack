require 'spec_helper'

describe User do
  before { @user = User.new(name: "Example", email: "user@example.com") }
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }

  it { should validate_uniqueness_of(:email).case_insensitive }

  describe "when name is empty" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is empty" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "ab"*30 }
    it { should_not be_valid }
  end

  describe 'email format' do
    context 'when email format is invalid' do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_addr|
          @user.email = invalid_addr
          expect(@user).not_to be_valid
        end
      end
    end

    context 'when email format is valid' do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-RE@f.b.org first.list@foo.jp a+b@baz.cn]
        addresses.each do |valid_addr|
          @user.email = valid_addr
          expect(@user).to be_valid
        end
      end
    end
  end
end
