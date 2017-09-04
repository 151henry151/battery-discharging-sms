#!/bin/bash

# battery_charge: Send SMS when battery is low
# Copyright (C) 2017 Perry Thompson
#
# Modified and redistributed by Henry Romp
# on 9-4-2017
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Set threshold
threshold=75

# May need to change path for your system, possibly BAT0
full=$(</sys/class/power_supply/BATA/energy_full)
now=$(</sys/class/power_supply/BATA/energy_now)
status=$(</sys/class/power_supply/BATA/status)

num=$(bc -l <<<"($now / $full)*100")
num=${num%%\.*}

# Insert your information, for example for verizon you use 
# your phone number at vtext.com
from="your@emailaddress.com"
to="yourphonenumber@yourprovidertext.com"
mail_server="mail.yourmailserver.com:yourportnumber"

echo "num = $num"
echo "status = $status"

# If you prefer, you can
# get a text if EITHER you are 
# discharging or the battery drops
# below the threshold. 
# With the current if then, it requires both
# the battery to be below the threshold AND 
# it to be discharging


#if [[ $num -le $threshold ]] || [[ "$status" == "Discharging" ]]; then

#

if [[ $num -le $threshold ]] && [[ "$status" == "Discharging" ]]; then

	{
echo "EHLO localhost"
sleep 2
echo "AUTH LOGIN"
sleep 2

# Insert your base64 username
echo "base64username"
sleep 2
# Made with command echo -ne 'yourusername' | base64

# Insert your base64 password
echo "base64password"
sleep 3
# Made with command echo -ne 'yourpassword' | base64

echo "MAIL FROM: $from"
echo "RCPT TO: $to"
sleep 2
echo "DATA"
sleep 2
echo "From: $from"
echo "To: $to"
echo "Date: $(date -R)"
echo "Message-ID: <$RANDOM.$RANDOM@$(hostname -f)>"
echo "Subject: BATTERY DYING"
echo ""
echo "Battery at $num"
echo "."
echo "quit"
} | openssl s_client -quiet -servername ${mail_server%:*} -crlf -connect $mail_server
fi

