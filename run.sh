#!/bin/bash

# go first
echo "Start test for Go"
go test -bench=. -count 1

# swift next
echo "Compiling swift"
swiftc benchmark_test.swift

echo "Start test for Swift"
time -p ./benchmark_test
rm benchmark_test

# javascript
nodejs --version
time nodejs benchmark_test.js

# time for C
echo "Start test for C (gcc)"
gcc benchmark_test
time -p ./a.out
rm a.out

echo "Start test for C (clang)"
clang benchmark_test
time -p ./a.out
rm a.out

echo "Start test for PHP"
php --version
time -p php benchmark_test.php

echo "Start test for Python"
python --version
time -p python benchmark_test.py
