module Address
  def self.table_name_prefix
    'address_'
  end

  def to_s
    name
  end
end