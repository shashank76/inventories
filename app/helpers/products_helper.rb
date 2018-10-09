require 'money/bank/open_exchange_rates_bank'
module ProductsHelper

	def update_currency_rate(code)
		oxr = Money::Bank::OpenExchangeRatesBank.new
		oxr.app_id = '02c8342e547a4dd5a2863a8edb2d5a5d'
		oxr.update_rates
		Money.default_bank = oxr
		Money.default_bank.get_rate('INR', code).round(4)
	end

	def current_zone
		@ip = request.ip
		country_code = Geocoder.search(@ip).first.country
		# @c = ISO3166::Country[country_code]
		@c = ISO3166::Country['in']
		@c = @c.currency
	end

	def price_calculation(price, rate)
		'%.2f' % (price.to_f * rate)
	end
end
