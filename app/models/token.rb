class Token < ApplicationRecord
  belongs_to :user
  before_create :generate_token #esto es un callback de ror
  def is_valid?
    DateTime.now < self.expires_at
  end
  private
  def generate_token
    begin
      self.token = SecureRandom.hex
    end while Token.where(token: self.token).any?
    self.expires_at ||= 1.month.from_now

    #||= -> si no esiste lo asigna
    #= ->simplemente lo asigna
  end
end
