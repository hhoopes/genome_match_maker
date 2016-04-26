require 'csv'
require 'activerecord-import'

namespace :import do
  desc "Import shortened snp location list"
    task partial_locations: :environment do
      positions = []
      CSV.foreach("data/partial_snps.csv", headers: true) do |row|
        entry = Location.new(position: row["snp"])
        positions << entry
        if row["index"].to_i % 10 == 0
          puts "Added #{row["index"]}"
          Location.import positions
          puts "Count: #{Location.count}"
          positions = []
        end
      end
      Location.import positions
      puts "Final Count: #{Location.count}"
    end

  desc "Import all snp locations"
    task locations: :environment do
      positions = []
        CSV.foreach("data/full_snps.csv", headers: true) do |row|
          # next if row["index"].to_i < 310000
          if row["index"].to_i % 50000 == 0
            puts "Working on next batch from ##{row["index"]}"
            Location.import positions
            positions = []
          end
          entry = Location.new(position: row["snp"])
          positions << entry
        end
        Location.import positions
        puts "Final Count: #{Location.count}"
      end
end
