{b, div, p}  = React.DOM


PostList = React.createClass
  mixins: [Backbone.React.Component.mixin]
  createPost: (post)->
    div className: 'well', key: post.get('id'),
      b {}, post.get('title')
      p {}, post.get('body')

  render: ->
    div {},
      @props.collection.map(@createPost)






# This part is to initialize and call Backone collections or models
# Just refer to backbone for more information on this

posts = new App.Collections.Posts

posts.fetch().done ->
  # I added the slice to limit the posts to 5. You can remove this for all of them
  React.renderComponent PostList(collection: posts.slice(0,5)), document.getElementById('post-list')