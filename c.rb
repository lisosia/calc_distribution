#!/usr/bin/env ruby

# -- input format --
# 2 # following 2^2 lines
# 1* num1
# *1 num2
# 11 num3
# 00 num4

require "matrix"

n = gets.to_i

mat = []
right = []

# convert "*1*" through ["010","011","110","111"] to [0,0,1,1,0,0,1,1]
def code2arr(arr)
  size = arr.size
  bin = [""]
  arr.reverse.each_char do |c|
    if c=="*"
      bin = bin.map{|e| "0" + e } + bin.map{|e| "1" + e }
    else
      bin = bin.map{|e| c + e}
    end
  end
  
  ret = Array.new( 2**size, 0)
  bin.each{|b| ret[ b.to_i(2) ] += 1 }
  return ret
end

(2**n).times do
  l,r = gets.split
  l.chomp!
  raise "invalid format:#{l}" if l.size != n

  mat << code2arr(l)
  right << r.to_i
end

ret = Matrix[ *mat ].lup.solve( right )

def is_int(f)
  ( f.abs - f ).abs < 10**(-5)
end
# validate
raise "not int root" if ret.any?{ |e| ! is_int(e) }

numbers =  ret.to_a.map{|e| e.round}
numbers.each_with_index do |number, index|
  puts ( "%0#{n}b" % index ) + "\t" + number.to_s
end
