class TransfersController < AuthorizedController
  def new
    @transfer = TransferForm.new(current_user)
  end

  def create
    @transfer = TransferForm.new(current_user, transfer_params)

    if @transfer.submit
      redirect_to signed_in_root_path, notice: "Transfer successfully made."
    else
      render :new
    end
  end

  private

  def transfer_params
    params.require(:transfer_form).permit(:receiver, :amount)
  end
end
