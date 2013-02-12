Feature: human player makes the first move

As a human player
I want to submit a position to occupy
So that I can win the game

  Scenario: making the first move
    Given that the game has just begun
    When it is a players turn
    Then the player should be able to 1 select a space.

