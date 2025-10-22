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
                    timestamp = int(datetime.datetime.timestamp(datetime.datetime.strptime(array[0][1:-6], "%Y-%m-%dT%H:%M:%S.%f")))
                    if "Allocation Failure" in line:
                        pause = float(array[7][0:-2]) / 1000.0
                        line_dict[timestamp] = pause
                        total = pause + total
                    else:
                        line_dict[timestamp] = float(array[4][5:-1])

            for key in sorted(line_dict):
                dt = datetime.datetime.fromtimestamp(key)
                value = line_dict[key]
                x.append(dt)
                y.append(value)

            count = len(line_dict)
            print("GC Count: %d" % count)
            print("Average GC Time: %.2f ms" % (total / float(count) * 1000.0))
            print("Maximum GC Time: %.2f ms" % (float(max(y)) * 1000.0))
            print("Total GC Time: %.2f s" % total)

            plt.rcParams["figure.autolayout"] = True
            ax = plt.gca()
            formatter = mdates.DateFormatter("%H:%M:%S")
            ax.xaxis.set_major_formatter(formatter)
            ax.grid(True)
            plt.plot(x, y)
            plt.gcf().canvas.set_window_title(path)
            plt.title(path)
            plt.ylabel("gc secs")
            plt.show()
    except FileNotFoundError as e:
        print(e)

if __name__ == "__main__":
    if len(sys.argv) > 1:
        _parse(sys.argv[1])
