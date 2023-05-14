class TournamentsController < ApplicationController
  before_action :find_tournament, only: [:show]
  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament
  end

  private

  def find_tournament
    @tournament ||= Tournament.find(params[:id])
  end
end
