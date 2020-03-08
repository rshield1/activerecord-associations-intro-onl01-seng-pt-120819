class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    if Artist.all.any?{|i| i.name == "Drake"}
      self.artist = drake = Artist.find_by(name: "Drake")
      self.save
      drake.songs.push(self)
    else
      drake = Artist.new(name: "Drake")
      self.artist = drake
      drake.save
      drake.songs.push(self)
    end
  end
end