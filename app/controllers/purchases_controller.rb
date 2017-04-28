class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:notify]



def create
    @purchase = current_user.purchases.create(purchase_params)

    if @purchase
      values = {
        business: 'ariefrizkyr-facilitator@gmail.com',
        cmd: '_xclick',
        upload: 1,
        notify_url: 'http://e48c7fa9.ngrok.io/notify',
        amount: @purchase.price,
        description: @purchase.name,
        item_name: @purchase.room.listing_name,
        item_number: @purchase.id,
        quantity: 1,
        return: 'http://localhost:3000/'
      }
      flash[:notice] = "Payment Successfully done."
      redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    else
      redirect_to @purchase.room, alert: "Something went wrong!"
    end
  end

 

    protect_from_forgery except: [:notify]
 
  def notify
    byebug
    params.permit!
    status = params[:payment_status]

    reservation = Purchase.find(params[:item_number])

    if status = "Completed"
      reservation.update_attributes status: true
    else
      reservation.destroy
    end

    render nothing: true
  end

 protect_from_forgery except: [:your_sales]
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

