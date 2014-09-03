middleman-backbone-react
========================

Middleman template with backbone, react, slim, sass, and bootstrap.

I am using backbone-react-component to handle data for react,
https://github.com/magalhas/backbone-react-component

React is written in coffeescript, there's an example in the post_list component.

Bootstrap is setup to be easily customizable using boostrap variables.

An exmample post model and collection have been setup to show a complete interaction of all the libraries. Jsonplaceholder is used for fake API data, but can easily be replaced with any restful API. Be careful with wrapped APIs (rails) because backbone expects unwrapped data and submits unwrapped data. 



Setup
==================

git clone https://github.com/magalhas/backbone-react-component.git

bundle install

middleman server