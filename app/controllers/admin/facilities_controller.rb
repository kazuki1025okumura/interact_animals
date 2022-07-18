class Admin::FacilitiesController < Admin::BaseController
  before_action :set_facility, only: %i[show edit update destroy]
  def index
    @q = Facility.ransack(params[:q])
    @facilities = @q.result(distinct: true).order(created_at: :desc)
  end

  def show; end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      redirect_to admin_facilities_path, success: t('defaults.message.created', item: Facility.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Facility.model_name.human)
      render :new
    end
  end

  def edit; end

  def update
    if @facility.update(facility_params)
      redirect_to admin_facility_path(@facility), success: t('defaults.message.updated', item: Facility.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Facility.model_name.human)
      render :edit
    end
  end

  def destroy
    @facility.destroy!
    redirect_to admin_facilities_path, success: t('defaults.message.deleted', item: Facility.model_name.human)
  end

  private

  def set_facility
    @facility = Facility.find(params[:id])
  end

  def facility_params
    params.require(:facility).permit(:name, :image, :description, :close_day, :opening_hours, :tel_number, :address, :access, :parking, :price, :web_site, :remarks)
  end
end
