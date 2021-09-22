
# Import jtop python library. We will use this to access the Jetson_Stats service.
from jtop import jtop
import json, datetime


if __name__ == "__main__":

    with jtop() as jetson:
            # jetson.stats provides our system measurements as type dict.
            tmp = jetson.stats  
            # time and uptime are proved as time objects. These needed to be converted before passing as a JSON string,
            tmp["time"] = str(tmp["time"].strftime('%m/%d/%Y'))
            tmp["uptime"] = str(tmp["uptime"])
            # We then convert our dict -> Json string
            influx_json= {"jetson": tmp}
            print(json.dumps(influx_json), flush=True)

