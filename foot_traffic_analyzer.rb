Dir['./lib/**/*.rb'].each{|file| require file }
require "pry"

f = FootTrafficAnalyzer::Analyzer.new("sample1.txt")
f.result


f = FootTrafficAnalyzer::Analyzer.new("sample2.txt")
f.result