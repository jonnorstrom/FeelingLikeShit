class VotesController < ApplicationController

  def create
    @poop_id = Poop.find_by(desc: params[:desc]).id
    @vote = Vote.new(user_id: session[:user_id], poop_id: @poop_id)
    if @vote.save
      redirect_to "/#poop-rating"
    else
      @vote_errors = @vote.errors.full_messages
      redirect_to "/#poop-rating", flash: {:vote_errors => @vote_errors}
    end
  end

  def index
    if request.xhr?
      render json: Poop.all.order(:id).map{ |poo| poo.votes.length }
    end
  end
end
