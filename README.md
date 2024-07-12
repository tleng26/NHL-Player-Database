# NHL Player Database

This application streamlines the process of identifying player scoring statistics by allowing users to filter results based on team and/or position.




## Data

The bar graph in the application visually represents the points accrued by each player during the 2021 NHL season. Players can be located by applying filters based on their NHL team, position on the ice, and name.

The dataset includes players who have logged over 3,000 seconds of ice time—approximately equivalent to five NHL games—allowing for a focused analysis of those who have significantly participated in the full 82-game season. Each row in the dataset corresponds to a player and tracks five key statistics:

- Team: The abbreviation of the city's NHL team for which the player competes.
- Position: The player's position, categorized as C (Center), L (Left Wing), R (Right Wing), or D (Defenseman).
- Ice Time: The cumulative seconds the player has spent on the ice during the season.
- I_F_Points: The aggregate of goals and assists recorded by the player.
- I_F_Goals: The total goals scored by the player.

This structured data presentation enables users to efficiently analyze player performance across multiple dimensions.




## Usage
1. Clone the repository: `git clone https://github.com/your-username/NHL-Statistics-App.git`
2. Run all .R scripts to start the R Shiny server and access the app
3. Interact with the application:
  - Use the dropdown menus to filter NHL player statistics by team, position, and name
  - View a detailed table displaying player stats, using the checkbox to filter player attributes
