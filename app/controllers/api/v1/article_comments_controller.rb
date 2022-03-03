class Api::V1::ArticleCommentsController < ApplicationController
  before_action :set_api_v1_comment, only: %i[ show update destroy ]

  def index
    @comments = ArticleComment.all
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = ArticleComment.new(comment: params[:comment],date_of_comment: params[:date_of_comment],myarticle_id: params[:myarticle_id])

    if @comment.save
      result = { type: 'Success', data: ActiveModelSerializers::SerializableResource.new(@comment, each_serializer: ArticleCommentSerializer), message: ["user created successfully"],
    status: 200}
      render json: result
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment: params[:comment],date_of_comment: params[:date_of_comment],myarticle_id: params[:myarticle_id])
      render json: "Successfully updated"
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    render json: "Successfully deleted"
  end

  def comment_search
    @comment = ArticleComment.find_by(comment: params[:comment])
    if @comment
      render json: @comment
    else
      render json: "record doesn't exist."
    end
  end
  
  private
  
    def set_api_v1_comment
      @comment = ArticleComment.find(params[:id])
    end
end
  
