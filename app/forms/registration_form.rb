class RegistrationForm
  include ActiveModel::Model

  attr_accessor :name, :email, :password
  attr_reader :registered_user

  validate :validate_models

  def submit
    if valid?
      ActiveRecord::Base.transaction do
        user.save!
        account.save!
        set_registration_user
      end
    end
  end

  private

  attr_writer :registered_user

  def user
    @_user ||= User.new email: email, name: name, password: password
  end

  def account
    @_account ||= user.build_account
  end

  def validate_models
    [user, account].each { |model| add_errors model.errors if model.invalid? }
  end

  def add_errors(model_errors)
    model_errors.each { |attribute, message| errors.add attribute, message }
  end

  def set_registration_user
    self.registered_user = user
  end
end
