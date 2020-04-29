class User < ApplicationRecord
    PASSWORD_FORMAT = /\A(?=.{8,25})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/x

    validates :login, length: { minimum: 6}, uniqueness: true, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: true}, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :password, presence: true, format: { with: PASSWORD_FORMAT},confirmation: true, on: :create
    validates :password, allow_nil: true, format: { with: PASSWORD_FORMAT }, confirmation: true, on: :update
    has_secure_password
end
