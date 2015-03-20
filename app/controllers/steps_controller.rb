class StepsController < ApplicationController
  before_action :set_theme
  before_action :set_step, only: [:edit, :update, :destroy, :index]

  # GET /steps
  # GET /steps.json
  def index
    @steps = Step.all
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
    @step = Step.find(params[:id])
  end

  # GET /steps/new
  def new
    @step = Step.new
  end

  # GET /steps/1/edit
  def edit
    @step = Step.find(params[:id])
  end

  # POST /steps
  # POST /steps.json
  def create
    @step = @theme.steps.build(step_params)
    if @step.save
      redirect_to @theme, notice: "Step has been successfully created"
    else
      render :new
    end
  end

  # PATCH/PUT /steps/1
  # PATCH/PUT /steps/1.json
  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to theme_path(@theme), notice: 'Step was successfully updated.' }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to themes_url, notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_theme
      @theme = Theme.find(params[:theme_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_params
      params.require(:step).permit(:step, :theme_id)
    end
end
