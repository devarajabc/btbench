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

    print("|benchmark       |native  |translated |ratio (%) |")
    print("|----------------|--------|-----------|----------|")

    for key, label, mode in all_benchmarks:
        t = translated.get(key)
        n = native.get(key)
        try:
            tf = float(t) if t else None
        except (ValueError, TypeError):
            tf = None
        try:
            nf = float(n) if n else None
        except (ValueError, TypeError):
            nf = None
        if tf is None and nf is None:
            continue
        fmt = "%-8.3f" if mode == 'lower' else "%-8.2f"
        tfmt = "%-11.3f" if mode == 'lower' else "%-11.2f"
        if tf is not None and nf is not None:
            if mode == 'lower':
                ratio = nf / tf * 100.0 if tf != 0 else 0
            else:
                ratio = tf / nf * 100.0 if nf != 0 else 0
            print(("|%-16s|" + fmt + "|" + tfmt + "|%-10.1f|") % (label, nf, tf, ratio))
        elif tf is not None:
            print(("|%-16s|%-8s|" + tfmt + "|%-10s|") % (label, "-", tf, "-"))
        else:
            print(("|%-16s|" + fmt + "|%-11s|%-10s|") % (label, nf, "-", "-"))

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
