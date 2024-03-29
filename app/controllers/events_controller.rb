# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /events
  # GET /events.json
  def index
    authorize(Event)
    @events = policy_scope(Event).order(:name)
  end

  # GET /events/1
  # GET /events/1.json
  def show; end

  # GET /events/new
  def new
    @event = Event.new
    authorize(@event)
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    authorize(@event)

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, notice: "Event was successfully created.") }
        format.json { render(:show, status: :created, location: @event) }
      else
        format.html { render(:new) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to(@event, notice: "Event was successfully updated.") }
        format.json { render(:show, status: :ok, location: @event) }
      else
        format.html { render(:edit) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to(events_url, notice: "Event was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
    authorize(@event)
  end

  # Never trust parameters from the scary internet, only allow the allowlist through.
  def event_params
    params.require(:event).permit(:name, :start_date, :end_date, :registration_start_date, :registration_end_date, :active)
  end
end
