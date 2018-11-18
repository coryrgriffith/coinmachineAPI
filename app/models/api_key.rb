class ApiKey < ApplicationRecord
  before_create :generate_access_token
  validate :access_token, uniqueness: true


  # create a unique random API key
  private
    def generate_access_token
      begin
        self.access_token = SecureRandom.hex
      end while self.class.exists?(access_token: access_token)
    end
end
