Feature: the beginning of the game

As a human player
I want to be able to start the game
So that I can play the game

  Scenario: start game
    Given that I am not yet playing the game
    When I start the game
    Then I should see a message saying "Tic-Tac-Toe Time!"
