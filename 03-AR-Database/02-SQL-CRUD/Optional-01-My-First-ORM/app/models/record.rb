# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.
require 'pry-byebug'

class Record
  def initialize(attrs = {})
    @id = attrs[:id]
  end

  def self.find(id)
    DB.results_as_hash = true
    table = self.to_s.downcase + "s"
    result = DB.execute("SELECT * FROM #{table} WHERE id = ?", id)
    return nil if result.empty?

    args = result[0].transform_keys(&:to_sym)
    new_instance = self.new
    # binding.pry
    args.each_pair do |k, v|
      new_instance.instance_variable_set("@#{k}", v)
      self.attr_reader k
    end
    new_instance
  end

  def self.all
    DB.results_as_hash = true
    table = self.to_s.downcase + "s"
    results = DB.execute("SELECT * FROM #{table}")

    sym_keys = results.map do |result|
      result.transform_keys(&:to_sym)
    end

    sym_keys.each_pair do |k, v|
      self.new.instance_variable_set("@#{k}", v)
      self.attr_reader k
    end

  end


  def save
  end

  def destroy
  end
end
