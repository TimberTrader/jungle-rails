class OrderMailer < ApplicationMailer
  default from: 'no-reply@ejungle.com'
 
  def order_confirmation_email(order)
  @order = order
    mail(to: @order.email, subject: "Order: #{@order.id} Confirmation")
  end
end
