#!/bin/bash

TIME='/usr/bin/time -f %E'
HR='\n---------------------------------'

# go first
echo $HR
echo "Start test for Go"
mv benchmark_test.c benchmark_test.cx
go test -bench=. -count 1
go test -bench=. -count 1
go test -bench=. -count 1
mv benchmark_test.cx benchmark_test.c

# swift next
echo $HR
echo "Start test swift"
swiftc benchmark_test.swift
$TIME ./benchmark_test
$TIME ./benchmark_test
$TIME ./benchmark_test
rm benchmark_test

# java
java -version
javac benchmark_test.java 
$TIME java Benchmark
$TIME java Benchmark
$TIME java Benchmark
rm Benchmark.class

# javascript
nodejs --version
$TIME nodejs benchmark_test.js
$TIME nodejs benchmark_test.js
$TIME nodejs benchmark_test.js

# time for C
echo "Start test for C (gcc)"
gcc benchmark_test.c
$TIME ./a.out
$TIME ./a.out
$TIME ./a.out
rm a.out

echo "Start test for C (clang)"
clang benchmark_test.c
$TIME ./a.out
$TIME ./a.out
$TIME ./a.out
rm a.out

echo "Start test for PHP"
php --version
$TIME php benchmark_test.php
$TIME php benchmark_test.php
$TIME php benchmark_test.php

echo "Start test for Python"
python --version
$TIME python benchmark_test.py
$TIME python benchmark_test.py
$TIME python benchmark_test.py
