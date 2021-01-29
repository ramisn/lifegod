class CollectionsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all.order("created_at DESC")
    @total = @collections.sum(:amount)
    @balance = (10000 - @total)
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    # @family = Family.find_by("id = ?", params[:trip][:family_id])
  end

  # GET /collections/new
  def new
    @collection = Collection.new
    @location = Inven.all
    @names = Inven.all
    @collection_type = [['Family', 1], ['Donation', 2]]

    # puts params[:collection][:location] if params[:collection][:location]
    @locations = Location.all
    if params[:location_id]
      puts params[:location_id]   
      loc_id = Location.find_by(loc_name: params[:location_id]).id
      puts loc_id
      @families = Family.where("location_id = ?", loc_id)
      puts @families.inspect
    else
      @families = Family.all
    end
    if request.xhr?
      respond_to do |format|
          format.json {
              render json: {family: @families}
          }
      end
    end
  end

  def update_families
    puts params[:location_id]
    loc_id = Location.find_by(loc_name: params[:location_id]).id
    puts loc_id
    @families = Family.where("location_id = ?", loc_id)
    respond_to do |f|
      f.js
    end

    @collection = Collection.new
    @locations = Location.all
    # # redirect_to new
    # respond_to do |format|
    #   # if @collection.save
    #     format.html { redirect_to new, notice: 'Collection was successfully created.' }
    #     format.json { render :show, status: :created, location: @collection }
    #   # else
    #   #   format.html { render :new }
    #   #   # format.json { render json: @collection.errors, status: :unprocessable_entity }
    #   # end
    # end
    # @location = Location.find params[:location_id]
    # @families = @location.family
  end

  def get_family_by_location
    @families = Family.where("location_id = ?", params[:location_id])
    respond_to do |format|
      format.json { render :json => @families }
    end
  end 
  def family_search
    if params[:location].present? && params[:location].strip != ""
      @families = Family.where("location_id = ?", params[:location_id])
    else
      @families = Family.all
    end
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to root_path, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collection_params
      params.require(:collection).permit(:cl_date, :location, :tag_id, :name, :amount, :collection_type, :fix_amount)
    end
end
