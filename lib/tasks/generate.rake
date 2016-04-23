require 'csv'
require 'activerecord-import'

namespace :import do
  desc "Import shortened snp location list"
    task partial_locations: :environment do
      positions = []
      CSV.foreach("data/partial_snps.csv", headers: true) do |row|
        entry = Location.new(position: row["snp"])
          puts "Added #{row["index"]}" if row["index"].to_i % 10 == 0
          positions << entry
      end
      Location.import positions
    end

    desc "Import shortened snp location list"
      task locations: :environment do
        positions = []

          CSV.foreach("data/full_snps.csv", headers: true) do |row|
            positions << Location.new(position: row["snp"])
            puts "Added #{row["index"]}" if row["index"].to_i % 100000 == 0
          end
          import = Location.import positions

      end
end
