#!/usr/local/bin/ruby
# encoding: UTF-8

count = 0 
c = @corpus["Tree (data structure)"]
c.each do |d|
  w = Wikialgo.new
  w.title = d[0]
  w.category = "Tree (data structure)"
  w.save
  kt = d[1]
  kt.each do |kk|
    p = Page.new
    p.title = kk[0]
    p.link = kk[1]
    if kk[2]
    p.img_url = kk[2]
    puts "img "
    end
    p.wikialgo = w
    p.save
  end
  puts w.title
  puts w.pages.count
end
#@s =@stringdesc.to_a()
#@s.each do |s|
#  puts s[0]
#  w = Wikialgo.find_by(:title => "#{s[0]}")
#  puts w.title
#  tt = s[1].to_a
#   tt.each do |ttt|
#    d = Description.new    
#    d.content = ttt[1]
#    d.source = ttt[0]
#    d.wikialgo = w
#    d.save
#end
#end