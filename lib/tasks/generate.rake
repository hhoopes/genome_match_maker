require 'csv'

namespace :import do
  desc "Import shortened snp location list"
    task partial_locations: :environment do
      CSV.foreach("data/partial_snps.csv", headers: true) do |row|
        Location.create(position: row["snp"])
        puts "Added #{row["snp"]}"
      end
    end

    desc "Import shortened snp location list"
      task locations: :environment do
        CSV.foreach("data/full_snps.csv", headers: true) do |row|
          Location.create(position: row["snp"])
          puts "Added #{row["snp"]}"
        end
      end
end
