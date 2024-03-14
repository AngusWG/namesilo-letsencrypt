import os

# Get your API Key from: https://www.namesilo.com/account_api.php
apikey = os.environ["apikey"]
print("apikey:", apikey)
# Minutes to wait for DNS changes to complete.
wait = int(os.environ.get("wait", "25"))
print("wait:", wait)
