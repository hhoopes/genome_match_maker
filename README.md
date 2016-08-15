[![Stories in Ready](https://badge.waffle.io/hhoopes/genome_match_maker.png?label=ready&title=Ready)](https://waffle.io/hhoopes/genome_match_maker)

### Live in production: [Genome Match Maker](http://genomematchmaker.herokuapp.com)

### Description
Genome Match Maker utilizes 23 and Me's API to pair two types of users in today's genetic marketplace: participants who have had their genome typed through 23 and Me and researchers who would like to create an anonymous research pool based around a certain genetic mutation. Currently researchers rely on referrals from doctors and advertisements then must genotype patients for confirmation, but the number of people using 3rd party genetic typing is increasing and provides another source for these two parties to find each other.

23 and Me's API provides access to over a million SNPs (genetic mutations), both their locations and the mutation found at that point, and my app coordinates that information with two types of users. Hence, the resulting database has a complexity not just from its size but also from its schema.

### Included technologies
* Caching strategies on any page creating study-to-participant matches
* In Heroku production with Redis To Go, Puma, and a background Sidekiq worker to update access tokens
* In development running with Sidekiq-cron to update access tokens
* Internal API to check whether DNA SNPs are valid when a researcher creates a new study, responds with AJAX-driven feedback
* Handtooled authentication without the aid of a gem

### To setup this project:

* Set up the database, minus seeding
* Load a few valid DNA locations `rake import:partial_locations`
* However, to use the seeds file, you need to create at least 2000 locations. Run `rake import:locations` and you can kill the process after the output informs you that the first batch has concluded
* Seed the database with matching studies `rake db:seed`

### [Initial MVP for project:](https://gist.github.com/hhoopes/1f270f751aa8aa6836d1a093744bafa0)
