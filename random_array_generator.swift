import Glibc

for i in 1...1000 {
  print(random() % 100, terminator:"")
  print(",", terminator:"")
}
