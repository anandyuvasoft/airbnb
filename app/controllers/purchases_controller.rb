class PurchasesController < ApplicationController

  #before_action :authenticate_user!, except: [:notify]
  protect_from_forgery except: [:notify, :your_sales]
  skip_before_action :authenticate_patient!, :authenticate_doctor!

  def create
    @purchase = current_user.purchases.create(purchase_params)
    room  = @purchase.room

    if @purchase
      values = {
        business: 'ariefrizkyr-facilitator@gmail.com',
        cmd: '_xclick-subscriptions',
        upload: 1,
        notify_url: 'http://98a4b73e.ngrok.io/purchase_notify',
        item_name: room.listing_name,
        invoice: @purchase.id,
        quantity: 1,
        return: 'http://98a4b73e.ngrok.io/',
        a3: @purchase.price,
        p3: 12,
        t3: 'M'

      }
      redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    else
      redirect_to room, alert: "Something went wrong!"
    end
  end

  def notify
    params.permit!
    purchase = Purchase.find(params[:item_number])

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

