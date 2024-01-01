up:
	docker compose run --rm freqtrade backtesting --strategy E0V1E --timeframe 5m --timeframe-detail 1m -c user_data/config.json -c user_data/exchange.json --timerange 20200101-20210220 > README.txt && cat README.txt

ho:
	docker compose run --rm freqtrade hyperopt --random-state 100 --hyperopt-loss SortinoHyperOptLossDaily --strategy E0V1E --timeframe 5m --timeframe-detail 1m -c user_data/config.json -c user_data/exchange.json --space buy roi --timerange 20200401-20210220 -e 1000 -j 1

list:
	docker compose run --rm freqtrade hyperopt-list --profitable --min-avg-profit 2.0 --min-total-profit 10000

data:
	docker compose run --rm freqtrade download-data --timeframe 5m 1m -c user_data/exchange.json --timerange 20200101-

edit:
	sudo -E vim user_data/strategies/E0V1E.py

dca-edit:
	sudo -E vim user_data/strategies/E0V1E_DCA.py

json:
	sudo -E vim user_data/strategies/E0V1E_DCA.json
