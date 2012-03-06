require 'spec_helper'

describe Micropost do

  before(:each) do
    @attr = {
        :content => "value for content",
        :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Micropost.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @user = Factory(:user)
      @micropost = @user.microposts.create(@attr)
    end

    it "should have a user attribute" do
      @micropost.should respond_to(:user)
    end

    it "should have the right associated user" do
      @micropost.user_id.should == @user.id
      @micropost.user.should == @user
    end

    it "should have a microposts attribute" do
      @user.should respond_to(:microposts)
    end
  end

  describe "validations" do

    before(:each) do
      @user = Factory(:user)
      @attr = { :content => "value for content" }
    end

    it "should require a user id" do
      Micropost.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @user.microposts.build(:content => "  ").should_not be_valid
    end

    it "should reject long content" do
      @user.microposts.build(:content => "a" * 301).should_not be_valid
    end
  end
end
