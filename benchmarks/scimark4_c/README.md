# scimark4_c benchmark

[This](https://math.nist.gov/scimark2/download_c.html) is an ANSI C version of the SciMark benchmark, translated from the original Java sources. The intent in making this benchmark available in C is mainly for performance comparisons.

`UNPCKHPD`, `MOVZX`, `PTEST`, `CLC`, `PMOVZXBW`, `ROUNDSD`, `CVTDQ2PD`, `MOVLPD` and `MOVHPD` opcodes optimization effect is obvious.

```
/your/path/box64 ./scimark4
/your/path/box64 ./scimark4 -large
```

## JNI

```
export JAVA_HOME="/usr/lib/jvm/java-1.8.0"
make libjniscimark4-amd64
$(JAVA_HOME)/bin/java -Djava.library.path=./ SciMark4
```
