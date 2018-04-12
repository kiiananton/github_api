class User < Base
  API_PATH = "https://api.github.com/users"
  private_constant :API_PATH

  def self.from_username username
    new get_data "#{API_PATH}/#{username}"
  end

  def login
    @data[:login]
  end

  def email
    @data[:email]
  end

  def followers
    @followers ||= get_data_associations.map { |d| User.new d }
  end

  def repos
    @repos ||= get_data_associations.map { |d| Repo.new d }
  end

  def subscriptions
    @subscriptions ||= get_data_associations.map { |d| Subscription.new d }
  end

  def organizations
    @organizations ||= get_data_associations.map { |d| Organization.new d }
  end
end
