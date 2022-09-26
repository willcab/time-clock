class StoresController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:create, :new, :edit, :update, :destroy]
  def index
    @stores = Store.all
    @pagy, @stores = pagy_countless(@stores, items: 5)
  end

  def show
    @store = Store.find(params[:id])
    @employees = Employee.where(store: @store)
    @pagy, @employees = pagy_countless(@employees, items: 5)
  end

  def new
    @store = Store.new()
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to @store, sucess:"new store created"
    else
      render :new, info: "A error", status: :unprocessable_entity
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])

    if @store.update(store_params)
      redirect_to @store, sucess:"The store updated"
    else
      render :edit, info: "A error",status: :unprocessable_entity
    end
  end

    def destroy
      @store = Store.find(params[:id])
      @store.destroy
      redirect_to stores_path, status: :see_other
    end

  private
    def store_params
      params.require(:store).permit(:name, :address)
    end
end
