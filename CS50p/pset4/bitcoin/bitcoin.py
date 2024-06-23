import requests
import sys

if len(sys.argv) != 2:
    sys.exit("Missing command-line argument")
else:
    try:
        no_of_bitcoins = float(sys.argv[1])
    except ValueError:
        sys.exit("Command-line argument is not a number")

try:
    r = requests.get('https://api.coindesk.com/v1/bpi/currentprice.json')
    response = r.json()

    bitcoin = response['bpi']['USD']['rate_float']

    value = bitcoin * no_of_bitcoins
    print(f"${value:,.4f}")
except requests.RequestException:
    sys.exit("Request Exception")