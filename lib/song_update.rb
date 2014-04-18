# encoding: UTF-8


count_l = 0
count_i = 0
count_a = 0 
count_w = 0
count_sm = 0
count_sf = 0
@bollycorpus.each do |d|
  w = Song.new
  
  w.title = d[0]
  w.lang = "hindi"
  
  if d[1]['album']
    w.album = d[1]['album']
  end
 
  artst = []
  if d[1]['artists']
    d[1]['artists'].each do |art|
      artst << art
    end   
  end
  w.artists = artst
    
  if d[1]['song_wiki']
  w.wiki = d[1]['song_wiki']
  else
    puts 'no wiki'
    count_w = count_w+1
  end
  if d[1]['artist_wiki']
    w.wiki_artist = d[1]['artist_wiki']
  end 
  
  if d[1]['lyric_url']
  w.lyrics = d[1]['lyric_url']
  else
  puts "no lyrics"
  count_l = count_l+1
  end
  
  if d[1]['songfacts']
  w.facts = d[1]['songfacts']
  else
  puts "no facts"
  count_sf = count_sf+1
  end
  
  w.lastfm_url = d[1]['lfm_url']
  
  if d[1]['imgs']
  w.img_s = d[1]['imgs'][0]
  w.img_m = d[1]['imgs'][1]
  else
  puts "no image"
  count_i = count_i+1
  end
    
  arr_video = []  
  if d[1]['video_yt']
  d[1]['video_yt'].each do |ddd|
    arr_video << ddd
  end  
  end
  w.video_yt = arr_video
  
  arr_audio = []  
  if d[1]['audio_sc']
  d[1]['audio_sc'].each do |ddd|
    arr_audio << ddd
  end
  if d[1]['audio_sc']==[]
  puts "no audio found "
  count_a = count_a+1
  end
  end
  w.audio_sc = arr_audio
  
  arr_sm = []
  if d[1]["sgmean_sm"]
    d[1]["sgmean_sm"].each do |ddd|
      arr_sm << ddd
    end
  if d[1]["sgmean_sm"]==[]
    puts "no meaning for song"
    count_sm = count_sm+1
  end
  end
  w.meaning = arr_sm
  
  w.save
  puts w.title
end
puts "no audio in "+count_a.to_s
puts "no lyrics in "+count_l.to_s
puts "no image in "+count_i.to_s
puts "no sm in "+count_sm.to_s
puts "no wiki in "+count_w.to_s
puts "no facts in "+count_sf.to_s
