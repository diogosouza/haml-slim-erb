require 'benchmark'

number = (0..50).to_a.sort{ rand() - 0.5 }[0..10000]

puts Benchmark.measure {
  20_000.times do
    number[rand()] * (0..50).to_a.sort{ rand() - 0.5 }[0..10000][rand()]
  end
}