class PostController < ApplicationController
  def index
    posts = Post.all
    render("index.slang")
  end

  def show
    if post = Post.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect_to "/posts"
    end
  end

  def new
    puts csrf_tag
    post = Post.new
    render("new.slang")
  end

  def create
  post = Post.new(params.to_h.select(["title"]))

    if post.valid? && post.save
      flash["success"] = "Created Post successfully."
      redirect_to "/posts"
    else
      flash["danger"] = "Could not create Post!"
      render("new.slang")
    end
  end

  def edit
    puts csrf_tag
    if post = Post.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect_to "/posts"
    end
  end

  def update
    if post = Post.find(params["id"])

      post.title = params["title"]
      if post.valid? && post.save
        flash["success"] = "Updated Post successfully."
        redirect_to "/posts"
      else
        Amber::Server.instance.log.info "Post is valid? #{post.valid?} && Changed? #{post.changed?}"
        flash["danger"] = "Could not update Post!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect_to "/posts"
    end
  end

  def destroy
    if post = Post.find params["id"]
      post.destroy
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
    end
    redirect_to "/posts"
  end
end
