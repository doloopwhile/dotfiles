#!/usr/bin/env ruby
require 'yaml'
require 'pp'

ARGV.each do |a|
  y = open(a) do |f|
    YAML.load(f)
  end

  sort = lambda do |x|
    if x.is_a? Hash
      Hash[x.map{|k,v| [k, sort[v]]}.sort]
    else
      x
    end
  end

  y = sort[y]
  open(a, 'w') do |f|
    y.to_yaml.lines.each do |line|
      f.puts line.rstrip
    end
  end
end
