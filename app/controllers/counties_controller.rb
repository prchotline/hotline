class CountiesController < ApplicationController
  before_action :set_county, only: [:show, :edit, :update, :destroy]

  # GET /counties
  # GET /counties.json
  # def index
  #   @counties = County.all
  # end
  def index  
# I will explain this part in a moment.
  if params[:term]
    puts "hello"
    puts params[:term]
    @counties = County.where("name ilike ?", "%#{params[:term]}%")
    for c in @counties
      puts c.name
    end
    arr = []
    @counties_autocomplete = @counties.map do |c|
      arr.push(c.name)
    end   
    #@counties_autocomplete = @counties.map(&:id)
  else
    @counties = County.all
  end

  respond_to do |format|  
    format.html # index.html.erb  
# Here is where you can specify how to handle the request for "/people.json"
    format.json { render :json => @counties_autocomplete[0]}
    end
end

  # GET /counties/1
  # GET /counties/1.json
  def show
  end

  # GET /counties/new
  def new
    @county = County.new
  end

  # GET /counties/1/edit
  def edit
  end

  # POST /counties
  # POST /counties.json
  def create
    @county = County.new(county_params)

    respond_to do |format|
      if @county.save
        format.html { redirect_to @county, notice: 'County was successfully created.' }
        format.json { render :show, status: :created, location: @county }
      else
        format.html { render :new }
        format.json { render json: @county.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /counties/1
  # PATCH/PUT /counties/1.json
  def update
    respond_to do |format|
      if @county.update(county_params)
        format.html { redirect_to @county, notice: 'County was successfully updated.' }
        format.json { render :show, status: :ok, location: @county }
      else
        format.html { render :edit }
        format.json { render json: @county.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counties/1
  # DELETE /counties/1.json
  def destroy
    @county.destroy
    respond_to do |format|
      format.html { redirect_to counties_url, notice: 'County was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_county
      @county = County.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def county_params
      params.require(:county).permit(:name)
    end
end
