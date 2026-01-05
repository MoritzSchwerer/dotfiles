"""
Display air quality data from an Awair Element.

Configuration parameters:
    ip: IP address of the Awair device (default '127.0.0.1')
    format: Display format (default '[Awair: {temp}°C {humid}% CO2:{co2}]')
    timeout: Connection timeout in seconds (default 5)
    thresholds: Dictionary of thresholds for color changing (default {})

Format placeholders:
    {score} Awair score (0-100)
    {temp}  Temperature (Celsius)
    {humid} Humidity (%)
    {co2}   Carbon Dioxide (ppm)
    {voc}   Volatile Organic Compounds (ppb)
    {pm25}  Particulate Matter 2.5 (µg/m³)

Color thresholds:
    You can set color thresholds for any placeholder.
    Example: thresholds = {'co2': [(1000, 'bad'), (800, 'degraded'), (0, 'good')]}

Requires:
    requests
"""

import requests


class Py3status:
    # Configuration defaults
    ip = "127.0.0.1"
    format = "Awair: {temp}°C {humid}% CO2:{co2}"
    timeout = 2
    cache_timeout = 60

    def awair(self):
        url = "http://{}/air-data/latest".format(self.ip)
        data = {}

        try:
            response = requests.get(url, timeout=self.timeout)
            if response.status_code == 200:
                # Awair returns: {"timestamp":..., "score":..., "temp":..., "humid":..., "co2":..., "voc":..., "pm25":...}
                data = response.json()
            else:
                return None
                # return {
                #     "full_text": "Awair: Error {}".format(response.status_code),
                #     "color": self.py3.COLOR_BAD,
                # }
        except Exception:
            return None
            # return {"full_text": "Awair: Down", "color": self.py3.COLOR_BAD}

        # Apply thresholds to the data based on configuration
        # This allows you to color the output based on CO2 levels, etc.
        color = self.py3.threshold_get_color(data["co2"], "co2")
        # self.py3.threshold_get_color(data["temp"], "temp")
        # self.py3.threshold_get_color(data["humid"], "humid")

        data["temp"] = int(data["temp"] + 0.5)
        # data["co2"] = (data["co2"] + 5) // 10 * 10

        # Format the output using the data dictionary
        full_text = self.py3.safe_format(self.format, data)

        return {
            "full_text": full_text,
            "cached_until": self.py3.time_in(self.cache_timeout),
            "color": color,
        }
