# URL Shortener 

### Setup and Installation

1. Git clone https://github.com/mmcdevi1/url_shortener.git
2. cd into url_shortner directory
3. run bundle install
4. rake db:migrate
5. rake db:seed to seed fake data (if necessary)

### Comments

In order to create a URL shortener, a custom slug was required to append to the url of this app. I decided to create a slug by taking the custom 'id' of each url saved in the database and converting it to its Base 36 equivalent. This works out well because large numbers, such as 1 Billion, are converted to just 6 characters. One of the challenges I faced with this was actually creating and saving the slug into the database once the Link has been created because the unique 'id' was required to create the slug. The unique 'id' of each Link is only available once the Link has been created so I decided to use the ActiveRecord callback 'after_create' to allow me to do this in the Link model. For future improvements, I would create a slug by using Base 62 Equivalent.

### Link to Heroku app

Link to [Herokuapp](https://nameless-river-7527.herokuapp.com/), is currently seeded with fake data. So, the links will not work. But, of course the url shortener will.