#!/usr/bin/env ruby

# Written by Nick Green

require 'io/console'
begin
  require 'colorize'
rescue LoadError
  puts 'Running without colors. Install colorize gem for colors'
end

branches = `git branch --sort=-committerdate | head -n 10`.lines

max_length = branches.map(&:length).max
branches.each_with_index do |branch, idx|
  color = idx % 2 == 0 ? :green : :cyan
  puts "#{idx}: #{branch.strip.ljust(max_length)} #{idx}".colorize(color)
end

choice = STDIN.getch

if choice !~ /[0-9]/
  exit 0
end

system("git checkout #{branches[choice.to_i]}")
