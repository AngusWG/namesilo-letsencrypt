command="certbot -i nginx --manual --agree-tos --noninteractive --preferred-challenges=dns --manual-auth-hook \"python /app/authenticator.py\" --manual-cleanup-hook \"python /app/cleanup.py\" --email \"$email\" -d \"$domain\" -d \"*.$domain\""

echo "The command to be executed:"
echo "$command"

eval "$command"
