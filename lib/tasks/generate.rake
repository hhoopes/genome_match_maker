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
        CSV.foreach("data/heroku_snps.csv", headers: true) do |row|
          i = row["index"].to_i
          next if i < 700000
          entry = Location.new(position: row["snp"])
          positions << entry
          if i % 50000 == 0
            puts "Starting to load..."
            Location.import positions
            puts "Loaded #{i}"
            positions = []
          end
        end
        puts "Starting to load final batch..."
        Location.import positions
        puts "Final Count: #{Location.count}"
      end

      desc "Import all snp locations for heroku"
        task locations_heroku: :environment do
          positions = []
            CSV.foreach("data/heroku_snps.csv", headers: true) do |row|
              if row["id"].to_i > 249000
                Location.create(position: row["snp"])
              end
            end
          end
end
