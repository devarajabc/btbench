#!/usr/bin/env python

import sys
import os
import datetime
from matplotlib import pyplot as plt, dates as mdates

def _parse(path, title='IPC'):
    try:
        line_dict = {}
        x = []
        y = []
        total = 0.0
        for root, dirs, files in os.walk(path):
            for _path in files:
                with open(root + "/" + _path) as f:
                    for line in f:
                        if "insn per cycle" in line:
                            array = line.split()
                            timestamp = int(datetime.datetime.timestamp(datetime.datetime.strptime(_path[5:-4], "%Y%m%d%H%M%S")))
                            ipc = float(array[3])
                            line_dict[timestamp] = ipc
                            total = ipc + total
                            break
        for key in sorted(line_dict):
            dt = datetime.datetime.fromtimestamp(key)
            value = line_dict[key]
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
        plt.gcf().canvas.set_window_title(title)
        plt.title(title)
        plt.ylabel("ipc")
        plt.show()
    except FileNotFoundError as e:
        print(e)

if __name__ == "__main__":
    if len(sys.argv) > 2:
        _parse(sys.argv[1], sys.argv[2])
    elif len(sys.argv) > 1:
        _parse(sys.argv[1])
