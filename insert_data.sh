#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv |  while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR == 'year' ]]
    then
      continue
    fi
    if [[ $WINNER != 'winner' && $OPPONENT != 'opponent' ]]
      then
        $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      fi 
    if [[ $ROUND != 'round' && $WINNER_GOALS != 'winner_goals' && $OPPONENT_GOALS != 'opponent_goals' ]]
      then
        INSERT_ALL=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
      fi
  done
