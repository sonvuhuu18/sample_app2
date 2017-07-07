class Micropost < ApplicationRecord
  belongs_to :user

  validates :user,
    presence: true
  validates :content,
    presence: true,
    length: {maximum: Settings.content_max_length}
  validate :picture_size

  scope :newest_first, -> {order created_at: :desc}
  scope :feeds, ->(id) do
    where "user_id IN (SELECT followed_id FROM relationships
       WHERE follower_id = #{id}) OR user_id = #{id}"
  end

  mount_uploader :picture, PictureUploader

  private

  def picture_size
    errors.add :picture, I18n.t("less_than_5MB") if picture.size > 5.megabytes
  end
end
