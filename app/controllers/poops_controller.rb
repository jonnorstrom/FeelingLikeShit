class PoopsController < ApplicationController

  def index
    check_for_user
    @vote = Vote.new
    @poops = Poop.all
  end
end
