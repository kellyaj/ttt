Feature: human player makes the first move

As a human player
I want to submit a position to occupy
So that I can win the game

  Scenario: making the first move
    Given that the game has just begun
    When a player sees the prompt "Choose a space to occupy."
    Then the player should be able to enter 1 through 9 to select a space.

