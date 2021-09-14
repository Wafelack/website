#!/usr/bin/env ruby
require 'org-ruby'
require 'fileutils'

def make_article_path(title)
  "articles/#{title.gsub(' ', '_').downcase}"
end

def compile_article(title)
  fname = make_article_path(title)
  raw = File.open("#{fname}.org", "r") { |f| f.read }
  body = Orgmode::Parser.new(raw).to_html
  File.open("#{fname}.html", "w") { |f|
    f.write "<!DOCTYPE html>
<html>
  <head>
      <meta charset=utf8 />
      <meta name=viewport content=\"width=device-width, initial-scale=1.0\" />
      <meta name=keywords content=\"Programming, Wafelack, Rust, Free Software\" />
      <meta name=\"description\" content=\"Wafelack's blog\" />
      <title>#{title}</title>
      <link rel=icon href=../assets/icon.png />
      <link rel=stylesheet type=text/css href=../master.css />
  </head>
  <body>
    #{body}
    <a href=\"../\">Go To Main Page</a>
    </body>
    <footer><hr>Copyright (C) 2021 Wafelack<br>All this website's content is licensed under <a href=\"https://creativecommons.org/licenses/by-sa/4.0/?ref=chooser-v1\">CC BY-SA 4.0</a> license.</footer>
</html>"}

end

if ARGV.length != 2
  STDERR.puts "Usage: article.rb [compile|new] <title>"
  exit 1
end

aname = ARGV[1]

if ARGV[0] == "compile"
  compile_article aname 
elsif ARGV[0] == "new"
  fname = make_article_path(aname)
  File.open("#{fname}.org", "w") { |f| f.write "* #{aname}\n/#{Time.now.strftime("%Y-%m-%d")}/\n" }
  puts "Source file is located at `#{fname}.org.`"
else
  STDERR.puts "Invalid action: #{ARGV[0]}.\nAvailable actions: compile,new."
end
