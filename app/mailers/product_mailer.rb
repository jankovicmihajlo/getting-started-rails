class ProductMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.in_stock.subject
  #
  def in_stock
    product = Product.first
    subscriber = product.subscribers.first || product.subscribers.build(email: "preview@example.com")

    ProductMailer.with(product: product, subscriber: subscriber).in_stock
  end
end
