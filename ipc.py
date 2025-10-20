#!/usr/bin/env python

import sys
import datetime
from matplotlib import pyplot as plt, dates as mdates

def _parse(path):
    try:
        with open(path) as f:
            line_dict = {}
            x = []
            y = []
            total = 0.0
            for line in f.readlines():
                array = line.split()
                if len(array) > 1:
                    timestamp = int(datetime.datetime.timestamp(datetime.datetime.strptime(array[0][7:21], "%Y%m%d%H%M%S")))
                    ipc = float(array[4])
                    line_dict[timestamp] = ipc
                    total = ipc + total
            for key in sorted(line_dict):
                dt = datetime.datetime.fromtimestamp(key)
                value = line_dict[key]
                #print("%s %f" % (dt.strftime("%H:%M:%S"), value))
                x.append(dt)
                y.append(value)
            print("Average IPC: %f" % (total / float(len(line_dict))))
            print("Maximum IPC: %f" % (float(max(y))))
            plt.rcParams["figure.autolayout"] = True
            ax = plt.gca()
            formatter = mdates.DateFormatter("%H:%M:%S")
            ax.xaxis.set_major_formatter(formatter)
            ax.grid(True)
            plt.plot(x, y)
            plt.gcf().canvas.set_window_title(path)
            plt.title(path)
            plt.ylabel("ipc")
            plt.show()
    except FileNotFoundError as e:
        print(e)

if __name__ == "__main__":
    if len(sys.argv) > 1:
        _parse(sys.argv[1])
