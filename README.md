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



refactor

GameAPIAdapter::search("search string")
thin out controller
class/module GameAPIAdapter
  include httpparty
  def self.search(string)
  api stuff

end

TO MAKE A USER HOST A GAME:

Upon Game object creation, do

Game.create(name: …
    …
    ..

    host: <USER OBJECT>
    )

TO ADD A PLAYER TO A GAME

After Game object creation, do

game.players << <USER OBJECT>

To see all of a Game object’s players, do

game.players

To see all games that a user has joined, do

user.games

To see a game’s host, do

game.host

To see a user’s hosted games, do

user.hosted_games


CHANGES MADE IN CONTROLLERS/VIEWS:

games_controller:
Saving a game:
Line 44 => Line 45?
Adding a player to a game:
Lines 3 and 4 => Line 5?

Now you can change the view in show.erb to iterate through all of game.players and show all the usernames of the people in your game.

If you have a user profile, then you can make it so that a player can see all of their hosted and joined games!
