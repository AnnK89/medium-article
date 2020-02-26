class AuthorRepo
  def initialize(csv)
    @csv = csv
    @authors = []
    @next_id = 1
    load_csv
  end

  def find(id)
    @authors.find { |author| author.id == id }
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name]
      row[:posts] = row[:posts]
      row[:info] = row[:info]
      author = Author.new(row)
      @authors << author
      @next_id = id + 1
    end
  end
end
