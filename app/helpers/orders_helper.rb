module OrdersHelper
  def render_order_status(order)
    status_text = I18n.t("order.statuses.#{order.status}")

    css_class = case order.status
                when 0
                  "bg-yellow-500 text-white px-3 py-1 rounded-full inline-block text-sm"
                when 1
                  "bg-green-600 text-white px-3 py-1 rounded-full inline-block text-sm"
                else
                  "bg-gray-500 text-white px-3 py-1 rounded-full inline-block text-sm"
                end

    content_tag(:span, status_text, class: css_class)
  end
end
