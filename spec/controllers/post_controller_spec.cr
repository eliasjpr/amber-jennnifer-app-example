require "./spec_helper"

def create_subject
  subject = Post.new
  subject.title = "test"
  subject.save
  subject
end

describe PostController do
  Spec.before_each do
    Post.clear
  end

  describe PostController::Index do
    it "renders all the posts" do
      subject = create_subject
      get "/posts"
      response.body.should contain "test"
    end
  end

  describe PostController::Show do
    it "renders a single post" do
      subject = create_subject
      get "/posts/#{subject.id}"
      response.body.should contain "test"
    end
  end

  describe PostController::New do
    it "render new template" do
      get "/posts/new"
      response.body.should contain "New Post"
    end
  end

  describe PostController::Create do
    it "creates a post" do
      post "/posts", body: "title=testing"
      subject_list = Post.all
      subject_list.size.should eq 1
    end
  end

  describe PostController::Edit do
    it "renders edit template" do
      subject = create_subject
      get "/posts/#{subject.id}/edit"
      response.body.should contain "Edit Post"
    end
  end

  describe PostController::Update do
    it "updates a post" do
      subject = create_subject
      patch "/posts/#{subject.id}", body: "title=test2"
      result = Post.find(subject.id).not_nil!
      result.title.should eq "test2"
    end
  end

  describe PostController::Delete do
    it "deletes a post" do
      subject = create_subject
      delete "/posts/#{subject.id}"
      result = Post.find subject.id
      result.should eq nil
    end
  end
end
