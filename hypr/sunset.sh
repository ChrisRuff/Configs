#!/usr/bin/env python

import time
import subprocess
from datetime import datetime, timezone
from suntime import Sun
from threading import Timer

LAT = 42.360081
LON = -71.058884

# Define min and max color temperatures
TEMP_MIN = 3000
TEMP_MAX = 6500

local_timezone = "America/Moncton"

# Sun position calculator
sun = Sun(LAT, LON)

def get_day_progress():
    """Returns a value from 0 (sunrise) to 1 (sunset) representing the daytime progress."""
    now = datetime.now(tz=timezone.utc)
    
    # Get todays sunrise and sunset times
    sunrise = sun.get_sunrise_time()
    sunset = sun.get_sunset_time()
    print(f"Sunrise: {sunrise}, Sunset: {sunset}")
    
    if now < sunrise:
        return 0  # Before sunrise, use TEMP_MIN
    elif now > sunset:
        return 1  # After sunset, use TEMP_MIN
    else:
        # Calculate normalized progress (0 at sunrise, 1 at sunset)
        return (now - sunrise).total_seconds() / (sunset - sunrise).total_seconds()

def calculate_temperature():
    """Interpolates temperature based on daytime progress."""
    progress = get_day_progress()

    temp = TEMP_MIN + (TEMP_MAX - TEMP_MIN) * progress
    return int(temp)

process = None
def update_temperature():
    """Sets color temperature using hyprsunset."""
    temp = calculate_temperature()
    print(f"Setting color temperature to {temp}K")

    global process
    if process:
        process.kill()
    process = subprocess.Popen(["hyprsunset", "-t", str(temp)])

if __name__ == "__main__":
    while True:
        update_temperature()
        time.sleep(3600)  # Update every 15 minutes
