require 'twitter_ebooks'

# This is an example bot definition with event handlers commented out
# You can define and instantiate as many bots as you like

class MyBot < Ebooks::Bot
  # Configuration here applies to all MyBots
  def configure
    # Consumer details come from registering an app at https://dev.twitter.com/
    # Once you have consumer details, use "ebooks auth" for new access tokens
    self.consumer_key = 'ziKibH45rZmAYp5jTGf0kDRQ6' # Your app consumer key
    self.consumer_secret = 'V9snrCrIASEqGpyBwP4B2lBZCNQ9UL5GKD2FXRnDhpSk54NkoJ' # Your app consumer secret

    # Users to block instead of interacting with
    self.blacklist = ['tnietzschequote']

    # Range in seconds to randomize delay when bot.delay is called
    self.delay_range = 1..6
  end

  def on_startup
    scheduler.every '24h' do
      # Tweet something every 24 hours
      # See https://github.com/jmettraux/rufus-scheduler
      # tweet("hi")
      # pictweet("hi", "cuteselfie.jpg")
    end
	
	scheduler.every '3h' do
	x = rand(30)+50
	xx = 130-x
	model = Ebooks::Model.load("model/testbot53191.model")
    statement = model.make_statement(140)# + " Big Mac " + model.make_statement(ii)
	i=rand(4)+1
		if i==1
			until statement.include? "mac" do
				statement = model.make_statement(140)
			end
		elsif i==2
			statement = model.make_statement(x) + "\r\n Big Mac: " + model.make_statement(xx)
			print statement
		elsif i==3
			bb = ["big mac"]
			statement = model.make_statement(125)
			statement = statement.split(" ")
			statement.delete(statement.last)
			statement1 = statement + bb
			statement = statement1.join(' ')
		else 
			
		end
	tweet(statement)
	end
  end 

  def on_message(dm)
    # Reply to a DM
    # reply(dm, "secret secrets")
  end

  def on_follow(user)
    # Follow a user back
    # follow(user.screen_name)
  end

  def on_mention(tweet)
    # Reply to a mention
	ii = rand(30)+45
	iii = 120-ii
	i=rand(4)+1
	
	model = Ebooks::Model.load("model/testbot53191.model")
	statement = model.make_statement(120) #+ " Big Mac " + model.make_statement(ii)
	if i==1
		until statement.include? "mac" do
			statement = model.make_statement(140)
		end
	elsif i==2
			statement = model.make_statement(ii) + "\r\n Big Mac: " + model.make_statement(iii)
	elsif i==3
			bb = ["big mac"]
			statement = model.make_statement(125)
			statement = statement.split(" ")
			statement.delete(statement.last)
			statement1 = statement + bb
			statement = statement1.join(' ')
	else 
	
	end
	reply(tweet,statement)
  end

  def on_timeline(tweet)
    # Reply to a tweet in the bot's timeline
    # reply(tweet, "nice tweet")
  end

  def on_favorite(user, tweet)
    # Follow user who just favorited bot's tweet
    # follow(user.screen_name)
  end
end

# Make a MyBot and attach it to an account
MyBot.new("realbuttgh0st") do |bot|
  bot.access_token = "4215907752-zam7CHsyFTsjMtKfBnA6Xl5fZMSSvvpW7jyaAVg" # Token connecting the app to this account
  bot.access_token_secret = "wyHxKNgyq6XIR17tn6r4yWAGLjxBpGNWl0NgQq4qUfw57" # Secret connecting the app to this account
  #bot.original = 'testbot53191'
  end
