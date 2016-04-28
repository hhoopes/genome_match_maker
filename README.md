[![Stories in Ready](https://badge.waffle.io/hhoopes/genome_match_maker.png?label=ready&title=Ready)](https://waffle.io/hhoopes/genome_match_maker)

### Live in production: [Genome Match Maker](http://genomematchmaker.herokuapp.com)

### To setup this project:

* Set up the database, minus seeding
* Load a few valid DNA locations `rake import:partial_locations`
* However, to use the seeds file, you need to create at least 2000 locations. Run `rake import:locations` and you can kill the process after the output informs you that the first batch has concluded
* Seed the database with matching studies `rake db:seed`

### Included technologies
* Caching strategies on any page creating study-to-participant matches
* In Heroku production with Redis To Go, Puma, and a background Sidekiq worker to update access tokens
* In development running with Sidekiq-cron to update access tokens
* Internal API to check whether DNA SNPs are valid when a researcher creates a new study, responds with AJAX-driven feedback

### [Initial MVP for project:](https://gist.github.com/hhoopes/1f270f751aa8aa6836d1a093744bafa0)
