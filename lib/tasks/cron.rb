class Tasks::Cron
  def self.count_like
    videos = Video.all
    for v in videos
      likes = Like.where video_id: v.id
      v.like = likes.size
      v.save
    end
  end
end
