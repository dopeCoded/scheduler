class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)
  
    if @schedule.save
      flash[:notice] = 'Schedule was successfully created.'
      redirect_to @schedule
    else
      render :new
    end
  end
  
  def update
    if @schedule.update(schedule_params)
      flash[:notice] = 'Schedule was successfully updated.'
      redirect_to @schedule
    else
      render :edit
    end
  end
  

  def destroy
    @schedule.destroy
    redirect_to schedules_url, notice: 'Schedule was successfully destroyed.'
  end

  private
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
      params.require(:schedule).permit(:title, :start_date, :end_date, :memo, :all_day)
    end
end
