require 'csv'

def show_database
  csv_options = { col_sep: ',', headers: :first_row }
  filepath    = 'lib/database.csv'
  xmas_list = []
  CSV.foreach(filepath, csv_options) do |row|
    xmas_list << { name: row["name"], status: row["status"] }
  end
  xmas_list
end

def update_database(user_gift_list)
  csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
  filepath    = 'lib/database.csv'

  CSV.open(filepath, 'wb', csv_options) do |csv|
    csv << ['name', 'status']
    user_gift_list.each do |list|
      csv << [list[:name], list[:status]]
    end
  end
end
