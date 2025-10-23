#!/usr/bin/env python

import sys
import os
import datetime
from matplotlib import pyplot as plt, dates as mdates

def _parse(path, title = "Top-Down"):
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
                        elif "insn per cycle" in line and "instructions" in line:
                            timestamp = int(datetime.datetime.timestamp(datetime.datetime.strptime(_path[5:-4], "%Y%m%d%H%M%S")))
                            array = line.split()
                            if len(array) < 8:
                                break
                            ipc = float(array[3])
                            retiring = float(array[7][1:-2]) / 100.0
                            line = next(f)
                            if "iTLB-load-misses" in line:
                                array = line.split()
                                itlb_load_misses = float(array[2][1:-2]) / 100.0
                            line = next(f)
                            if "branch-misses" in line:
                                array = line.split()
                                if len(array) < 3:
                                    break
                                branch_misses = float(array[2][1:-2]) / 100.0
                            bad_speculation = branch_misses
                            line = next(f)
                            if "L1-icache-load-misses" in line:
                                array = line.split()
                                l1_icache_load_misses = float(array[2][1:-2]) / 100.0
                            line = next(f)
                            if "L1-icache-prefetch-misses" in line:
                                array = line.split()
                                l1_icache_prefetch_misses = float(array[2][1:-2]) / 100.0
                            frontend_bound = (itlb_load_misses + branch_misses + l1_icache_load_misses + l1_icache_prefetch_misses) / 4.0
                            line = next(f)
                            if "dTLB-load-misses" in line:
                                array = line.split()
                                dtlb_load_misses = float(array[2][1:-2]) / 100.0
                            line = next(f)
                            if "dTLB-store-misses" in line:
                                array = line.split()
                                dtlb_store_misses = float(array[2][1:-2]) / 100.0
                            line = next(f)
                            if "dTLB-prefetch-misses" in line:
                                array = line.split()
                                dtlb_prefetch_misses = float(array[2][1:-2]) / 100.0
                            backend_bound = (dtlb_load_misses + dtlb_store_misses + dtlb_prefetch_misses) / 3.0
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
        print("Average IPC: %.2f" % (total_ipc / float(len(line_dict))))
        print("Maximum IPC: %.2f" % (float(max(y_ipc))))
        print("Retiring: %.2f-%.2f" % (float(min(y_retiring)), float(max(y_retiring))))
        print("Back-End Bound: %.2f-%.2f" % (float(min(y_backend_bound)), float(max(y_backend_bound))))
        print("Front-End Bound: %.2f-%.2f" % (float(min(y_frontend_bound)), float(max(y_frontend_bound))))
        print("Bad Speculation: %.2f-%.2f" % (float(min(y_bad_speculation)), float(max(y_bad_speculation))))
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
        plt.gcf().canvas.set_window_title(title)
        plt.title(title)
        plt.legend()
        plt.show()
    except FileNotFoundError as e:
        print(e)

if __name__ == "__main__":
    if len(sys.argv) > 2:
        _parse(sys.argv[1], sys.argv[2])
    elif len(sys.argv) > 1:
        _parse(sys.argv[1])
