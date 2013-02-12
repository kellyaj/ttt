Feature: playing a full game

As a player
I want to be able to play against another player
So that I can crush him in tic-tac-toe battle. And see the game over message.

	Scenario: full game play with computers
		Given that there are two computer players
		When I start the game
		Then they should be able to play until the end.

	Scenario: full game play with humans
		Given that there are two human players
		When I start the game
		Then we should be able to play until the end.