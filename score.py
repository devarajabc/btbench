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

def print_comparison(translated, native):
    """Print translated vs native comparison table with ratio."""
    # Benchmarks where higher is better
    higher_better = [
        ('scimark4_c',       'scimark4_c'),
        ('scimark4_c_large', 'scimark4_c large'),
        ('scimark2',         'scimark2'),
    ]
    # Benchmarks where lower is better (time-based)
    lower_better = [
        ('sljit', 'sljit (time/s)'),
    ]

    print("|benchmark       |native  |translated |ratio (%) |")
    print("|----------------|--------|-----------|----------|")

    for key, label in higher_better:
        n = native.get(key)
        t = translated.get(key)
        if n and t:
            try:
                nf = float(n)
                tf = float(t)
                ratio = tf / nf * 100.0 if nf != 0 else 0
                print("|%-16s|%-8.2f|%-11.2f|%-10.1f|" % (label, nf, tf, ratio))
            except ValueError:
                print("|%-16s|%-8s|%-11s|%-10s|" % (label, n, t, "N/A"))

    for key, label in lower_better:
        n = native.get(key)
        t = translated.get(key)
        if n and t:
            try:
                nf = float(n)
                tf = float(t)
                ratio = nf / tf * 100.0 if tf != 0 else 0
                print("|%-16s|%-8.3f|%-11.3f|%-10.1f|" % (label, nf, tf, ratio))
            except ValueError:
                print("|%-16s|%-8s|%-11s|%-10s|" % (label, n, t, "N/A"))

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python3 score.py <translated.log> [native.log]")
        sys.exit(-1)

    translated_scores = parse_log(sys.argv[1])

    if len(sys.argv) >= 3:
        native_scores = parse_log(sys.argv[2])
        print_comparison(translated_scores, native_scores)
    else:
        print_single(translated_scores)
