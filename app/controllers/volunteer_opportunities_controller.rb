# frozen_string_literal: true

class VolunteerOpportunitiesController < ApplicationController
  before_action :set_volunteer_opportunity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action(except: [:show, :destroy]) { authorize VolunteerOpportunity }

  # GET /volunteer_opportunities
  # GET /volunteer_opportunities.json
  def index
    @volunteer_opportunities = policy_scope(VolunteerOpportunity).order(visible: :desc, title: :asc)
  end

  # GET /volunteer_opportunities/1
  # GET /volunteer_opportunities/1.json
  def show
    authorize(@volunteer_opportunity)
  end

  # GET /volunteer_opportunities/new
  def new
    @volunteer_opportunity = VolunteerOpportunity.new
  end

  # GET /volunteer_opportunities/1/edit
  def edit
  end

  # POST /volunteer_opportunities
  # POST /volunteer_opportunities.json
  def create
    @volunteer_opportunity = VolunteerOpportunity.new(volunteer_opportunity_params)

    respond_to do |format|
      if @volunteer_opportunity.save
        format.html { redirect_to(@volunteer_opportunity, notice: "Volunteer opportunity was successfully created.") }
        format.json { render(:show, status: :created, location: @volunteer_opportunity) }
      else
        format.html { render(:new) }
        format.json { render(json: @volunteer_opportunity.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /volunteer_opportunities/1
  # PATCH/PUT /volunteer_opportunities/1.json
  def update
    respond_to do |format|
      if @volunteer_opportunity.update(volunteer_opportunity_params)
        format.html { redirect_to(@volunteer_opportunity, notice: "Volunteer opportunity was successfully updated.") }
        format.json { render(:show, status: :ok, location: @volunteer_opportunity) }
      else
        format.html { render(:edit) }
        format.json { render(json: @volunteer_opportunity.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /volunteer_opportunities/1
  # DELETE /volunteer_opportunities/1.json
  def destroy
    authorize(@volunteer_opportunity)
    @volunteer_opportunity.destroy
    respond_to do |format|
      format.html { redirect_to(volunteer_opportunities_url, notice: "Volunteer opportunity was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_volunteer_opportunity
    @volunteer_opportunity = VolunteerOpportunity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the allowlist through.
  def volunteer_opportunity_params
    params.require(:volunteer_opportunity).permit(:title, :objective, :duties_and_responsibilities, :qualifications_and_requirements, :shifts, :visible)
  end
end
