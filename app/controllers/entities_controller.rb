class EntitiesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # GET /entities/1/edit
  # def edit
  # end

  # POST /entities or /entities.json
  def create
    @entity = current_user.entities.new(entity_params)

    if @entity.save
      @category_transaction = @entity.category_transactions.create(category_transactions_params)
      flash[:notice] = 'Transaction was successfully created.'
    else
      flash[:alert] = "Failed to add transaction - #{@entity.errors.full_messages.first}"
    end
    redirect_to "/categories/#{@category_transaction.category_id}"
  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  def category_transactions_params
    params.require(:entity).permit(:category_id)
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
