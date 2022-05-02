class AnnualSignUpController < ApplicationController
  def index
    @event = Event.find_by(name: "The Annual Open")
  end
end
