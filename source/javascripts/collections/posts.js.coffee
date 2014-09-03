# I used jsonplaceholder for fake api data but
# feel free to use any restful API

App.Collections.Posts = Backbone.Collection.extend
  url: 'http://jsonplaceholder.typicode.com/posts'
  model: App.Models.Post
