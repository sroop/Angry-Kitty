class EventsController < ApplicationController

	def index
		@events = Event.all
		@event = Event.new
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event].permit(:title, :description, :deadline, :total))
		@event.save
		redirect_to('/events')
	end
end