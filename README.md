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

# USAGE:
# Set threshold
# May need to change path for your system, possibly BAT0
# Insert your information, for example for verizon you use 
# your phone number at vtext.com
# Insert your base64 username
# Made with command echo -ne 'yourusername' | base64
# Insert your base64 password
# Made with command echo -ne 'yourpassword' | base64

# I set a cron job up to run this script every 5 minutes.

