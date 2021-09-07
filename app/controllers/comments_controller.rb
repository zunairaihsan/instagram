class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @accountpost = Accountpost.find(params[:accountpost_id])
    @comment = @accountpost.comments.build(comments_params)
    @comment.account_id= current_account.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to accountposts_path, notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @accountposts = Accountpost.find(params[:accountpost_id])
    @comment = @accountposts.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to accountposts_path, notice: "Comment was successfully destroyed." }
    end
  end

  private

    def set_comment
      @accountposts = Accountpost.find(params[:accountpost_id])
    end

    def comments_params
     params.require(:comment).permit(:body)
    end
end
