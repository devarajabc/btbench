# -*- coding: utf-8 -*-

import sys
import os
import shutil
import subprocess
import time
from datetime import datetime

def run(cmd, log_file):
    with open(log_file, 'a') as out:
        return_code = subprocess.call(cmd, stdout=out, shell=True)

def log_marker(log_file, name):
    with open(log_file, 'a') as out:
        out.write("=== %s ===\n" % name)

def run_native(cwd, log_file):
    """Run benchmarks natively on ARM64 (no translator)."""
    print("btbench native mode start")

    ''' dav1d '''
    dav1d_bin = "%s/benchmarks/dav1d/dav1d-aarch64" % (cwd)
    dav1d_lib = "%s/benchmarks/dav1d/lib-aarch64" % (cwd)
    if not os.path.exists(dav1d_bin):
        dav1d_bin = shutil.which("dav1d")
        dav1d_lib = None
    ivf_path = "%s/benchmarks/dav1d/Chimera-AV1-8bit-480x270-552kbps.ivf" % (cwd)
    if not os.path.exists(ivf_path):
        os.system("wget http://dgql.org/~unlord/Netflix/Chimera/Chimera-AV1-8bit-480x270-552kbps.ivf -O %s" % (ivf_path))
    if dav1d_bin and os.path.exists(ivf_path):
        if dav1d_lib:
            os.environ['LD_LIBRARY_PATH'] = "%s:%s" % (dav1d_lib, os.environ.get('LD_LIBRARY_PATH', ''))
        log_marker(log_file, "dav1d")
        print("dav1d %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
        run("%s -i %s --muxer null 2>&1|tee %s" % (dav1d_bin, ivf_path, log_file), log_file)
    else:
        if not dav1d_bin:
            print("skip dav1d: dav1d not found")

    ''' 7z '''
    sevenz_bin = "%s/benchmarks/p7zip/7z-aarch64" % (cwd)
    if not os.path.exists(sevenz_bin):
        sevenz_bin = shutil.which("7zz") or shutil.which("7z")
    if sevenz_bin:
        log_marker(log_file, "7z")
        print("7z %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
        run("%s b" % (sevenz_bin), log_file)
    else:
        print("skip 7z: 7z not found")

    ''' scimark4_c '''
    scimark4_bin = "%s/benchmarks/scimark4_c/scimark4-aarch64" % (cwd)
    if os.path.exists(scimark4_bin):
        log_marker(log_file, "scimark4_c")
        print("scimark4_c %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
        run("%s" % (scimark4_bin), log_file)
        log_marker(log_file, "scimark4_c large")
        print("scimark4_c large %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
        run("%s -large" % (scimark4_bin), log_file)
    else:
        print("skip scimark4_c: %s not found" % (scimark4_bin))

    ''' scimark2 '''
    scimark2_dir = "%s/benchmarks/scimark2" % (cwd)
    scimark2_class = "%s/benchmarks/scimark2/jnt/scimark2/commandline.class" % (cwd)
    java_bin = "java"
    if os.environ.get('JAVA_HOME'):
        java_bin = "%s/bin/java" % (os.environ['JAVA_HOME'])
    if os.path.exists(scimark2_class):
        log_marker(log_file, "scimark2")
        print("scimark2 %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
        run("%s -Djava.library.path=%s -cp %s jnt.scimark2.commandline" % (java_bin, scimark2_dir, scimark2_dir), log_file)
    else:
        print("skip scimark2: %s not found" % (scimark2_class))

    ''' sljit '''
    sljit_bin = "%s/benchmarks/sljit/bin/sljit_test-aarch64" % (cwd)
    if not os.path.exists(sljit_bin):
        sljit_bin = "%s/benchmarks/sljit/bin/sljit_test" % (cwd)
    if os.path.exists(sljit_bin):
        log_marker(log_file, "sljit")
        print("sljit %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
        t0 = time.time()
        run("%s" % (sljit_bin), log_file)
        elapsed = time.time() - t0
        with open(log_file, 'a') as out:
            out.write("sljit elapsed: %.3f\n" % elapsed)
        print("sljit elapsed: %.3f s" % elapsed)
    else:
        print("skip sljit: %s not found" % (sljit_bin))

    ''' glmark2 '''
    glmark2_bin = "%s/benchmarks/glmark2/bin/glmark2-es2-drm-aarch64" % (cwd)
    if not os.path.exists(glmark2_bin):
        glmark2_bin = shutil.which("glmark2-es2-drm") or shutil.which("glmark2-es2")
    glmark2_data = "%s/benchmarks/glmark2/share/glmark2" % (cwd)
    if glmark2_bin:
        log_marker(log_file, "glmark2")
        print("glmark2 %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
        run("%s --data-path %s --off-screen" % (glmark2_bin, glmark2_data), log_file)
    else:
        print("skip glmark2: glmark2-es2 not found in PATH")

    print("btbench native mode end")
    run("cat /proc/cpuinfo", log_file)
    os.system("/usr/bin/python3 score.py %s" % (log_file))

def run_translated(tr, cwd, log_file):
    """Run benchmarks through a binary translator."""
    print("btbench %s start" % (tr))

    os.environ['BOX64_LOG'] = "0"
    os.environ['BOX64_NOBANNER'] = "1"

    ''' dav1d '''
    ivf_path = "%s/benchmarks/dav1d/Chimera-AV1-8bit-480x270-552kbps.ivf" % (cwd)
    if not os.path.exists(ivf_path):
        os.system("wget http://dgql.org/~unlord/Netflix/Chimera/Chimera-AV1-8bit-480x270-552kbps.ivf -O %s" % (ivf_path))
    if os.path.exists(ivf_path):
        os.environ['LD_LIBRARY_PATH'] = "%s/benchmarks/dav1d/lib-x86_64:%s" % (cwd, os.environ.get('LD_LIBRARY_PATH', ''))
        log_marker(log_file, "dav1d")
        print("dav1d %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
        run("%s %s/benchmarks/dav1d/dav1d-x86_64 -i %s --muxer null 2>&1|tee %s" % (tr, cwd, ivf_path, log_file), log_file)

    ''' 7z '''
    log_marker(log_file, "7z")
    print("7z %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
    run("%s %s/benchmarks/p7zip/7z-x86_64 b" % (tr, cwd), log_file)

    ''' scimark4_c '''
    log_marker(log_file, "scimark4_c")
    print("scimark4_c %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
    run("%s %s/benchmarks/scimark4_c/scimark4-x86_64" % (tr, cwd), log_file)
    log_marker(log_file, "scimark4_c large")
    print("scimark4_c large %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
    run("%s %s/benchmarks/scimark4_c/scimark4-x86_64 -large" % (tr, cwd), log_file)

    ''' scimark2 '''
    scimark2_dir = "%s/benchmarks/scimark2" % (cwd)
    scimark2_class = "%s/benchmarks/scimark2/jnt/scimark2/commandline.class" % (cwd)
    java_bin = "java"
    if os.environ.get('JAVA_HOME'):
        java_bin = "%s/bin/java" % (os.environ['JAVA_HOME'])
    if os.path.exists(scimark2_class):
        log_marker(log_file, "scimark2")
        print("scimark2 %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
        run("%s -Djava.library.path=%s -cp %s jnt.scimark2.commandline" % (java_bin, scimark2_dir, scimark2_dir), log_file)

    ''' sljit '''
    sljit_bin = "%s/benchmarks/sljit/bin/sljit_test-x86_64" % (cwd)
    if os.path.exists(sljit_bin):
        log_marker(log_file, "sljit")
        print("sljit %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
        t0 = time.time()
        run("%s %s" % (tr, sljit_bin), log_file)
        elapsed = time.time() - t0
        with open(log_file, 'a') as out:
            out.write("sljit elapsed: %.3f\n" % elapsed)
        print("sljit elapsed: %.3f s" % elapsed)

    ''' glmark2 '''
    glmark2_path = "%s/benchmarks/glmark2" % (cwd)
    log_marker(log_file, "glmark2")
    print("glmark2 %s" % (datetime.today().strftime('%Y-%m-%d %H:%M:%S')))
    run("%s %s/bin/glmark2-es2-drm-x86_64 --data-path %s/share/glmark2 --off-screen" % (tr, glmark2_path, glmark2_path), log_file)

    print("btbench %s end" % (tr))

    os.system("%s --version" % (tr))
    run("%s --version" % (tr), log_file)
    run("cat /proc/cpuinfo", log_file)
    os.system("/usr/bin/python3 score.py %s" % (log_file))

if __name__ == '__main__':
    cwd = os.getcwd()
    log_path = "%s/logs" % (cwd)
    if not os.path.exists(log_path):
        os.makedirs(log_path)
    cur_dt = datetime.today().strftime('%Y%m%d%H%M%S')

    if len(sys.argv) < 2:
        # Native mode
        log_file = "%s/native-%s.log" % (log_path, cur_dt)
        run_native(cwd, log_file)
    else:
        tr = sys.argv[1]
        if not os.path.exists(tr):
            print("%s not exists" % (tr))
            sys.exit(-1)
        log_file = "%s/%s-%s.log" % (log_path, os.path.basename(tr), cur_dt)
        run_translated(tr, cwd, log_file)
