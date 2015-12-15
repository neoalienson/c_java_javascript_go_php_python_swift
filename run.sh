#!/bin/bash

# go first
echo "Sart test for Go"
go test -bench=. -count 1

# swift next
echo "Compiling swift"
swiftc benchmark_test.swift

echo "Sart test for Swift"
time -p ./benchmark_test
rm benchmark_test
