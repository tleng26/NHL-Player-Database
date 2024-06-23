# NHL Player Database

This application makes it easy to find how many points a player has scored by filtering the scoring statistic based on their team and/or position, ultimately narrowing the amount of players you need to look through. Thus, you don't need to scroll through the hundreds of players to find the player you're looking for. This can also be useful if you're trying to find the points of players on a specific team or position. The table gives an in-depth summary of the players scoring and time spent on the ice.

## Data

The bar on the graph represents the number of points a player has put up during the 2021 NHL season. The player is found by filtering by the NHL team, position on the ice, and the name of the player.

The data consists of every player that has played over 3,000 seconds on the ice, which is equivalant to around 5 games in the NHL. This is done so we can focus on the players who have played a significant amount of the full 82-game season. Each row represents a player, in which there are 5 statistics tracked for each player:

Team: The abbreviation for the NHL city that the player plays for.

Position: There are four positions tracked. C(center), L(left wing), R(right wing), D(defenseman).

Ice time: The total amount of time in seconds the player has been on the ice during the season.

I_F_points: The total amount of goals and assists that the player had during the season.

I_F_goals: The total amount of goals that the player had during the season.

## References

- [Player statistics from the NHL in 2021](https://www.kaggle.com/datasets/mesadowski/nhl-player-and-team-data-20089202122)
