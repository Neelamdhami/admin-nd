class Image < ActiveRecord::Base

	mount_uploader :image_preview, AvatarUploader
end
