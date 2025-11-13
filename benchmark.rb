require 'benchmark'

string_hash = { 'string' => 'value' }
symbol_hash = { symbol: 'value' }
number_hash = { 100 => 'value' }
str = 'string'
sym = :symbol
num = 100

n = 100_000_000
Benchmark.bmbm do |x|
  x.report('String') { n.times { string_hash[str] } }
  x.report('Symbol') { n.times { symbol_hash[sym] } }
  x.report('Number') { n.times { number_hash[num] } }
end
