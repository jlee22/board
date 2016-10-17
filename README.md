my passion project!

User Story:
-User sees home page with games being hosted
-User can click on hosted games to see game description and the details of the user hosting it.
-User can register
-If registered & logged in, user can host a game.



todo:

add text function
edit game function
css/front end
more ajax
heroku


refactor

GameAPIAdapter::search("search string")
thin out controller
class/module GameAPIAdapter
  include httpparty
  def self.search(string)
  api stuff

end