if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_LWCEwRg2PudBbRoTSxpkM57R',
    secret_key: 'sk_test_yjxKBb0uZn4GphB7fJyBJVPW'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
