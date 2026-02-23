# -*- coding: utf-8 -*-

import sys

def parse_log(log_path):
    """Parse a btbench log file and return a dict of benchmark scores."""
    scores = {
        '7z': "",
        'dav1d': "",
        'scimark4_c': None,
        'scimark4_c_large': None,
        'scimark2': None,
        'sljit': None,
        'glmark2': "",
    }
    section = None
    with open(log_path, 'r') as file:
        for line in file:
            # Track section markers
            if line.startswith("=== ") and line.rstrip().endswith(" ==="):
                section = line.strip().strip("= ")
                continue

            if line.find("Tot") != -1:
                arr = line.split(" ")
                scores['7z'] = arr[-1][0:-1]
            elif line.find("Decoded") != -1 and line.find("frames") != -1 and line.find("100.0%") != -1:
                arr = line.split(" ")
                arr1 = arr[5].split("/")
                scores['dav1d'] = arr1[0]
            elif line.find("Composite Score") != -1:
                arr = line.split(" ")
                val = arr[-1].strip()
                if section == "scimark2":
                    scores['scimark2'] = val
                elif section == "scimark4_c large":
                    scores['scimark4_c_large'] = val
                else:
                    # default: scimark4_c (also handles legacy logs without markers)
                    if scores['scimark4_c'] is None:
                        scores['scimark4_c'] = val
                    elif scores['scimark4_c_large'] is None:
                        scores['scimark4_c_large'] = val
            elif line.find("sljit elapsed:") != -1:
                arr = line.split()
                scores['sljit'] = arr[-1]
            elif line.find("glmark2 Score") != -1:
                arr = line.split(" ")
                scores['glmark2'] = arr[-2]
    return scores

def print_single(scores):
    """Print scores from a single log (backwards compatible)."""
    print("|benchmark       |score bigger is better |")
    print("|----------------|-----------------------|")
    print("|7z              |%s                   |" % (scores['7z']))
    print("|dav1d           |%s                 |" % (scores['dav1d']))
    print("|scimark4_c      |%s                 |" % (scores['scimark4_c']))
    print("|scimark4_c large|%s                 |" % (scores['scimark4_c_large']))
    if scores['scimark2'] is not None:
        print("|scimark2        |%s                 |" % (scores['scimark2']))
    if scores['sljit'] is not None:
        print("|sljit (time/s)  |%s                 |" % (scores['sljit']))
    print("|glmark2         |%s                   |" % (scores['glmark2']))

def print_comparison(native, box64):
    """Print native vs box64 comparison table with ratio and normalized score."""
    # All benchmarks in display order: (key, label, mode)
    # mode: "higher" = higher is better, "lower" = lower is better (time-based)
    all_benchmarks = [
        ('7z',               '7z',              'higher'),
        ('dav1d',            'dav1d',           'higher'),
        ('scimark4_c',       'scimark4_c',      'higher'),
        ('scimark4_c_large', 'scimark4_c large', 'higher'),
        ('scimark2',         'scimark2',        'higher'),
        ('sljit',            'sljit (time/s)',  'lower'),
        ('glmark2',          'glmark2',         'higher'),
    ]

    print("|%-16s|%-10s|%-10s|%-8s|%-12s|" % ("benchmark", "native", "box64", "ratio", "normalized"))
    print("|%-16s|%-10s|%-10s|%-8s|%-12s|" % ("-" * 16, "-" * 10, "-" * 10, "-" * 8, "-" * 12))

    ratios = []
    for key, label, mode in all_benchmarks:
        n = native.get(key)
        b = box64.get(key)
        try:
            nf = float(n) if n else None
        except (ValueError, TypeError):
            nf = None
        try:
            bf = float(b) if b else None
        except (ValueError, TypeError):
            bf = None
        if nf is None and bf is None:
            continue
        if nf is not None and bf is not None:
            if mode == 'lower':
                ratio = nf / bf if bf != 0 else 0
            else:
                ratio = bf / nf if nf != 0 else 0
            ratios.append(ratio)
            nstr = "%.3f" % nf if mode == 'lower' else "%.2f" % nf
            bstr = "%.3f" % bf if mode == 'lower' else "%.2f" % bf
            print("|%-16s|%-10s|%-10s|%-8.2f|%-12.1f%%|" % (label, nstr, bstr, ratio, ratio * 100))
        elif bf is not None:
            bstr = "%.3f" % bf if mode == 'lower' else "%.2f" % bf
            print("|%-16s|%-10s|%-10s|%-8s|%-12s|" % (label, "-", bstr, "-", "-"))
        else:
            nstr = "%.3f" % nf if mode == 'lower' else "%.2f" % nf
            print("|%-16s|%-10s|%-10s|%-8s|%-12s|" % (label, nstr, "-", "-", "-"))

    if ratios:
        geo_mean = 1.0
        for r in ratios:
            geo_mean *= r
        geo_mean = geo_mean ** (1.0 / len(ratios))
        print("|%-16s|%-10s|%-10s|%-8.2f|%-12.1f%%|" % ("** geo mean **", "", "", geo_mean, geo_mean * 100))

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python3 score.py <native.log> [box64.log]")
        sys.exit(-1)

    if len(sys.argv) >= 3:
        native_scores = parse_log(sys.argv[1])
        box64_scores = parse_log(sys.argv[2])
        print_comparison(native_scores, box64_scores)
    else:
        scores = parse_log(sys.argv[1])
        print_single(scores)
