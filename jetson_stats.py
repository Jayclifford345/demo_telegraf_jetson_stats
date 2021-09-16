from jtop import jtop
import json, datetime

line_protical = "jetson_stats"
if __name__ == "__main__":
    with jtop() as jetson:
            tmp = jetson.stats
            tmp["time"] = str(tmp["time"].strftime('%m/%d/%Y'))
            tmp["uptime"] = str(tmp["uptime"])

            influx_json= {"jetson": tmp}
            print(json.dumps(influx_json))

# EOF