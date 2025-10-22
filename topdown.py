#!/usr/bin/env python

import sys
import os
import datetime
from matplotlib import pyplot as plt, dates as mdates

def _parse(path):
    try:
        line_dict = {}
        x = []
        y_ipc = []
        y_retiring = []
        y_bad_speculation = []
        y_frontend_bound = []
        y_backend_bound = []
        total_ipc = 0.0
        for root, dirs, files in os.walk(path):
            for _path in files:
                with open(root + "/" + _path) as f:
                    for line in f:
                        if "insn per cycle" in line and "retiring" in line and "bad speculation" in line and "frontend bound" in line and "backend bound" in line:
                            line = next(f)
                            array = line.split()
                            timestamp = int(datetime.datetime.timestamp(datetime.datetime.strptime(_path[5:-4], "%Y%m%d%H%M%S")))
                            ipc = float(array[0])
                            retiring = float(array[1][:-1]) / 100.0
                            bad_speculation = float(array[2][:-1]) / 100.0
                            frontend_bound = float(array[3][:-1]) / 100.0
                            backend_bound = float(array[4][:-1]) / 100.0
                            line_dict[timestamp] = [ipc, retiring, bad_speculation, frontend_bound, backend_bound]
                            total_ipc = ipc + total_ipc
                            break
        for key in sorted(line_dict):
            dt = datetime.datetime.fromtimestamp(key)
            ipc = line_dict[key][0]
            retiring = line_dict[key][1]
            bad_speculation = line_dict[key][2]
            frontend_bound = line_dict[key][3]
            backend_bound = line_dict[key][4]
            x.append(dt)
            y_ipc.append(ipc)
            y_retiring.append(retiring)
            y_bad_speculation.append(bad_speculation)
            y_frontend_bound.append(frontend_bound)
            y_backend_bound.append(backend_bound)
        print("Average IPC: %f" % (total_ipc / float(len(line_dict))))
        print("Maximum IPC: %f" % (float(max(y_ipc))))
        plt.rcParams["figure.autolayout"] = True
        ax = plt.gca()
        formatter = mdates.DateFormatter("%H:%M:%S")
        ax.xaxis.set_major_formatter(formatter)
        ax.grid(True)
        plt.plot(x, y_ipc, label = "ipc")
        plt.plot(x, y_retiring, label = "retiring")
        plt.plot(x, y_bad_speculation, label = "bad speculation")
        plt.plot(x, y_frontend_bound, label = "frontend bound")
        plt.plot(x, y_backend_bound, label = "backend bound")
        title = "Top-Down"
        plt.gcf().canvas.set_window_title(title)
        plt.title(title)
        plt.legend()
        plt.show()
    except FileNotFoundError as e:
        print(e)

if __name__ == "__main__":
    if len(sys.argv) > 1:
        _parse(sys.argv[1])
