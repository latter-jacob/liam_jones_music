class Song < ActiveRecord::Base
   mount_uploader :url, UrlUploader # Tells rails to use this uploader for this model.
end
