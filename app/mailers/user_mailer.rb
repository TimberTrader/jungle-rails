class UserMailer < ApplicationMailer
  default from: 'no-reply@ejungle.com'
 
  def order_email(userInfo, orderInfo }
  @order = orderInfo
  @user = userInfo
  @products = @order.line_items
    mail(to: @user.email, subject: "Order: #{@order.id}")
  end
end
