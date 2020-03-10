class Addon
  include Mongoid::Document
  field :name, type: String
  field :version, type: String
  field :wow_version, type: String
  field :description, type: String
  field :torrent_info, type: String

  has_and_belongs_to_many :users, dependent: :destroy
  validates :name, presence: true, length: { minimum: 5 }
  validates :version, presence: true, length: { minimum: 5 }
  validates :wow_version,
            presence: true,
            length: { minimum: 5 },
            format: { with: /(^Retail$|^Classic$|^PTR$)/,
                      message:
                      'Invalid wow version: Should be Retail, Classic, or PTR' }

  validates :description, presence: true, length: { minimum: 5 }
  validates :torrent_info, presence: true, length: { minimum: 5 }
  validates :users, presence: true
end
