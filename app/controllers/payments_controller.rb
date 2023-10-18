class PaymentsController < ApplicationController
  before_action :set_category
  before_action :authenticate_user!
  def index
    @payments = @category.payments.order(created_at: :desc)
  end

  def new
    @payment = Payment.new
    @categories = current_user.categories.all
  end

  def create
    @payment = Payment.find_or_initialize_by(name: payment_params[:name], amount: payment_params[:amount])
    @payment.user = current_user

    category_ids = payment_params[:category_ids] || []

    if category_ids.empty?
      redirect_to new_category_payment_path(@category), alert: 'Please choose at least one category.'
    else
      category_ids.each do |category_id|
        category = current_user.categories.find_by(id: category_id)
        @category = category
        @payment.categories << category unless @payment.categories.include?(category)
      end

      if @payment.save
        redirect_to category_payments_path(@category), notice: 'Payment created successfully'
      else
        render :new
      end
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, category_ids: [])
  end
end
