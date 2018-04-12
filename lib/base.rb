class Base

  def self.get_data path
    uri = URI.parse path
    res = Net::HTTP.get uri
    result = JSON.parse(res, symbolize_names: true)
    raise 'Something went wrong' if result.is_a?(Hash) && result[:message] =~ /Not Found/
    result
  end

  def initialize data
    @data = data
  end

  def name
    @data[:name]
  end

  protected

  def get_data_associations
    method_invoke = caller_locations.first.label.to_sym
    path = @data["#{method_invoke}_url".to_sym]
    return [] if path.nil? || path.empty?

    self.class.get_data path.gsub(/{.*}/,'')
  end

end
