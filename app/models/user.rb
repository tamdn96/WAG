class User < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :event_joiners, dependent: :destroy

  validates :email, presence: true, uniqueness: { scope: :provider }
  # validates :token, presence: true

  scope :_email_and_provider, -> (email, provider) {
    where(email: email, provider: provider)
  }
  scope :_token, -> (token) { where(token: token) }

  class << self
    def auth_user(email, provider, access_token)
      _email_and_provider(email, provider)._token(access_token)
    end
  end
end
