# frozen_string_literal: true

# Resource Controller interface
class ResourcesController < ApplicationController
  before_action :set_scope, only: %i[index show edit update destroy]
  before_action :set_record, only: %i[index new show edit update destroy]

  # To do: remove after actions, as they're only for development
  after_action :verify_authorized, only: %i[index new create show edit update destroy], unless: :dev?
  after_action :verify_policy_scoped, only: %i[index new create show edit update destroy], unless: :dev?

  helper_method :record, :record_class_name, :record_class, :index_attributes, :show_attributes,
                :json_attributes, :permitted_attributes

  def index
    authorize_record
  end

  def new
    authorize_record
  end

  def create
    record = record.update(permitted_attributes(record))
    authorize_record
    respond_to do |format|
      if record.save
        format.html { redirect_to record, notice: t('controller.success.create', model: record_class.human_name) }
        format.json { render :show, status: :created, location: record }
      else
        format.html { render :new }
        format.json { render json: record.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    authorize_record
  end

  def edit
    authorize_record
  end

  def update
    record = record.update(permitted_attributes(record))
    authorize_record
    respond_to do |format|
      if record.save
        format.html { redirect_to record, notice: t('controller.success.update', model: record_class.human_name) }
        format.json { render :show, status: :ok, location: record }
      else
        format.html { render :edit }
        format.json { render json: record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize_record
    respond_to do |format|
      format.html do
        redirect_to opportunity_applications_url,
                    { notice: t('controller.success.update', model: record_class.human_name) }
      end
      format.json { head :no_content }
    end
  end

  # public helper methods

  def record_class
    record_class_name.constantize
  end

  def record_class_name
    controller_path.classify
  end

  def index_attributes
    @index_attributes = []
  end

  def show_attributes
    @show_attributes = []
  end

  def json_attributes
    [*show_attributes, :created_at, :updated_at]
  end

  private

  # before_action methods

  def set_scope
    @scope = policy_scope(record_class)
  end

  def set_record
    if action_name == 'index'
      instance_variable_set(records_name, @scope)
    elsif (action_name == 'new') || (action_name == 'create')
      instance_variable_set(record_name, record_class.send(:new))
    else
      raise Pundit::NotAuthorizedError if @scope.empty?

      instance_variable_set(record_name, @scope.send(lookup_method, lookup_params))
    end
  end

  # before_action helper methods (to be overwritten in child controllers)

  def lookup_method
    :find_by
  end

  def lookup_params
    { id: params[:id] }
  end

  # helper methods for the controller

  def record
    name = action_name == 'index' ? records_name : record_name
    instance_variable_get(name)
  end

  def record=(value)
    name = action_name == 'index' ? records_name : record_name
    instance_variable_set(name, value)
  end

  def authorize_record
    authorize(record)
  end

  # helper methods

  def record_name
    records_name.singularize
  end

  def records_name
    "@#{controller_name}"
  end

  def dev?
    Rails.env.development?
  end
end
