class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:notify]
  protect_from_forgery except: [:notify, :your_sales]

  def create
    @purchase = current_user.purchases.create(purchase_params)

    if @purchase
      values = {
        business: 'ariefrizkyr-facilitator@gmail.com',
        cmd: '_xclick',
        upload: 1,
        notify_url: 'http://fe17ae85.ngrok.io//purchase_notify',
        amount: @purchase.price,
        description: @purchase.name,
        item_name: @purchase.room.listing_name,
        item_number: @purchase.id,
        quantity: 1,
        return: "http://fe17ae85.ngrok.io/your-sales"
      }
      redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    else
      redirect_to @purchase.room, alert: "Something went wrong!"
    end
  end

  def notify
    params.permit!
    purhcase = Purchase.find(params[:item_number])

    if params[:payment_status].eql? "Completed"
      purchase.update_attributes notification_params: params, status: true, transaction_id: params[:txn_id], purchased_at: Time.now
    else
      purchase.destroy
    end
    render nothing: true

  end

 
  def your_sales
    @sales = current_user.purchases.where("status = ?", true)
  end

  def your_purchases
    @rooms = current_user.rooms
  end

  private
    def purchase_params
      params.require(:purchase).permit(:price, :name, :room_id)
    end
end

