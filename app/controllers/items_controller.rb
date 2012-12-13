class ItemsController < ApplicationController
  before_filter :set_project_to_variable

  def new
    large_item_id = params[:large_item_id]
    medium_item_id = params[:medium_item_id]
    if large_item_id.blank?
      @item = @project.large_items.build
    elsif medium_item_id.blank?
      @item = @project.large_items.find(large_item_id).medium_items.build
    else
      @item = @project.large_items.find(large_item_id).medium_items.find(medium_item_id).small_items.build
    end
  end

  def create
    large_item_id = params[:large_item_id]
    medium_item_id = params[:medium_item_id]

    if large_item_id.blank?
      @item = @project.large_items.create!(params[:large_item])
    elsif medium_item_id.blank?
      @item = @project.large_items.find(large_item_id).medium_items.create!(params[:medium_item])
    else
      @item = @project.large_items.find(large_item_id).medium_items.find(medium_item_id).small_items.create!(params[:small_item])
    end

    redirect_to project_dashboard_path(@project.id)
  end

  def move_higher
    item = find_item_from_params
    item.move_higher

    redirect_to project_dashboard_path(@project)
  end

  def move_lower
    item = find_item_from_params
    item.move_lower

    redirect_to project_dashboard_path(@project)
  end

  private

  def set_project_to_variable
    @project = Project.find(params[:project_id])
  end

  def find_item_from_params
    large_item_id = params[:large_item_id]
    medium_item_id = params[:medium_item_id]

    if large_item_id.blank?
      @project.large_items.find(params[:id])
    elsif medium_item_id.blank?
      @project.large_items.find(large_item_id).medium_items.find(params[:id])
    else
      @project.large_items.find(large_item_id).medium_items.find(medium_item_id).small_items.find(params[:id])
    end
  end
end