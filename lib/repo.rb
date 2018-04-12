class Repo < Base

  def name
    @data[:name]
  end

  def assignees
    @assignees ||= get_data_associations.map { |d| User.new d }
  end
end
