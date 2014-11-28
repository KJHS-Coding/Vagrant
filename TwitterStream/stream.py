import os
from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
import tweepy.utils
json = tweepy.utils.import_simplejson()
import pymongo

# Go to http://apps.twitter.com and create an app.
# The consumer key and secret will be generated for you after
consumer_key=os.environ['twitter_consumer_key']
consumer_secret=os.environ['twitter_consumer_secret']

# After the step above, you will be redirected to your app's page.
# Create an access token under the the "Your access token" section
access_token=os.environ['twitter_access_token']
access_token_secret=os.environ['twitter_access_token_secret']

class MongoListener(StreamListener):
    """
    Inserts tweet data into a Mongo Database
    """
    def __init__(self, dbName = 'Twitter'):
        self.client = pymongo.MongoClient()
        self.db = self.client[dbName]
        self.collection = self.db['raw_tstream']

    def on_data(self, data):
        data = json.loads(data)
        #self.print_data(data)
        post_id = self.collection.insert(data)
        return True

    def print_data(self, data):
        for x in data.keys():
            print(x, ':\n\t\t' + str(data[x]))
        print('\n\n')

    def on_error(self, status):
        print(status)

if __name__ == '__main__':
    

    l = MongoListener()
    auth = OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)

    stream = tweepy.Stream(auth, l)
    stream.sample()
