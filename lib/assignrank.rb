@pt =[]
@youtube_links = 0
Wikialgo.where(:category => /optimiz/i).each do |w|
#if w.pages.where(:link=>/en.wikipedia/i).count > 1 
w.pages.where(:link => /www.youtube/i).each do |pg| 
    pg.prank = 6
    pg.save!
    puts pg.link
    @youtube_links= @youtube_links +1
end
end
puts @youtube_links
puts @pt.count
#w.pages.where(:link => /xlinux.nist.gov/i).each do |pg| 
#  pg.prank = 3
#  pg.save
#  puts pg.link
#  @youtube_links= @youtube_links +1
# end
# w.pages.where(:link => /en.wikipedia.+#{w.title.gsub(" ","_")}/i).each
#pg.link = pg.link.gsub("watch?v=","embed/")
    