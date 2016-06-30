class TicketsController < ApplicationController
  before_action :admin_only, only: [:index]

  def index
    @ticket = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user

    if @ticket.save
      redirect_to home_path, notice: "Your ticket was saved!"
    else
      render "new", notice: "Ticket was not saved. Please contact administrator."
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:topic, :effective, :prepare, :practice, :info, :other)
  end

end
