module OrdersHelper
  def formatted_time(time)
    time.strftime("%b %e, %l:%M %p")
  end
end
