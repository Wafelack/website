#!/usr/bin/env ruby
require 'org-ruby'
require 'fileutils'

if ARGV.length != 2
  STDERR.puts "Usage: article.rb [compile|new] <title>"
  exit 1
end

if ARGV[0] == "compile"
  raw = File.open(ARGV[1], "r") { |f| f.read }
  body = Orgmode::Parser.new(raw).to_html
  out = "#{ARGV[1].sub(".org", "")}.html"
  File.open(out, "a") { |f|
    f.write "#{body}
    <a href=\"../../../../\">Go To Main Page</a>
    </body>
    <footer><hr>Copyright (C) 2021 Wafelack<br>This website and all its content are licensed under <a href=\"https://creativecommons.org/licenses/by-sa/4.0/?ref=chooser-v1\">CC BY-SA 4.0</a> license.</footer>
</html>"}
elsif ARGV[0] == "new"
  aname = ARGV[1]
  basename = aname.gsub(' ', '_').downcase
  dname = Time.now.strftime("articles/%Y/%m/%d")
  FileUtils.mkdir_p dname
  fname = "#{dname}/#{basename}"
  File.open("#{fname}.org", "w") { |f| f.write "* #{aname}\n" }
  File.open("#{fname}.html", "w") { |f| f.write "<!DOCTYPE html>
<html>
  <head>
      <meta charset=utf8 />
      <meta name=viewport content=\"width=device-width, initial-scale=1.0\" />
      <meta name=keywords content=\"Programming, Wafelack, Rust, Free Software\" />
      <meta name=\"description\" content=\"Wafelack's blog\" />
      <title>#{aname}</title>
      <link rel=icon href=../../../../assets/icon.png />
      <link rel=stylesheet type=text/css href=../../../../css/master.css />
  </head>
  <body>\n" }
  puts "Source file is located at #{fname}.org (output: #{fname}.html)."
else
  STDERR.puts "Invalid action: #{ARGV[0]}.\nAvailable actions: compile,new."
end
