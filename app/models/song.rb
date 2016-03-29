class Song < ActiveRecord::Base
   mount_uploader :url, UrlUploader # Tells rails to use this uploader for this model.

  def self.search(query)
    where("title ilike ?", "%#{query}%")
  end

end
