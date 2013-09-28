class PatternsController < ApplicationController
  before_action :set_pattern, only: [:show, :edit, :update, :destroy]

  # GET /patterns
  # GET /patterns.json
  def index
    @patterns = Pattern.all
  end

  # GET /patterns/1
  # GET /patterns/1.json
  def show
  end

  # GET /patterns/new
  def new
    @pattern = Pattern.new
  end

  # GET /patterns/1/edit
  def edit
  end

  # POST /patterns
  # POST /patterns.json
  def create
    @pattern = Pattern.new(pattern_params)

    respond_to do |format|
      if @pattern.save
        format.html { redirect_to @pattern, notice: 'Pattern was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pattern }
      else
        format.html { render action: 'new' }
        format.json { render json: @pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patterns/1
  # PATCH/PUT /patterns/1.json
  def update
    respond_to do |format|
      if @pattern.update(pattern_params)
        format.html { redirect_to @pattern, notice: 'Pattern was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patterns/1
  # DELETE /patterns/1.json
  def destroy
    @pattern.destroy
    respond_to do |format|
      format.html { redirect_to patterns_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pattern
      @pattern = Pattern.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pattern_params
      out_params = params.require(:pattern).permit!

      [:content, :guess_state].each do |attr_name|
        out_params[attr_name] = params[:pattern][attr_name].map do |row|
          row.map(&:to_i)
        end if params[:pattern][attr_name]
      end

      out_params
    end
end
