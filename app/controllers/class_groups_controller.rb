class ClassGroupsController < ApplicationController

  helper_method :sort_column, :sort_direction
  
  inherit_resources

  actions :show, :new

  before_filter :load_before_index, :only => :index
  before_filter :load_class_group,  :only => :destroy


  def index
    @class_groups = ClassGroup.order( sort_column + " " + sort_direction)
  end

  def create
    super do |format|
      format.js { render }
    end
  end

  def edit
    super do |format|
      format.js { render }
    end
  end

  def update
    super do |format|
      format.js { render }
    end  
  end

  def destroy
    if @class_group.destroy && !request.xhr?
      flash[:notice] = "Class Group Destroyed"  
    end
    render :nothing => true
  end
  
  private

    def load_before_index
      @class_group = ClassGroup.new
    end

    def load_class_group
      @class_group = ClassGroup.find(params[:id])
    end

    def sort_column
      ClassGroup.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end

end
