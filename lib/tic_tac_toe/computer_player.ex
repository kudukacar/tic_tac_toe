defmodule TicTacToe.ComputerPlayer do
  alias TicTacToe.Player
  alias TicTacToe.ComputerPlayer
  alias TicTacToe.BoardUpdate
  alias TicTacToe.BoardInspect

  defstruct [:token, :selection]

  defimpl Player do
    def selection(
          %ComputerPlayer{token: token} = player,
          board,
          other_player
        ) do
      {position, _} =
        best_move(
          board,
          tokens(token, other_player),
          available_positions(board),
          []
        )

      %{player | selection: position}
    end

    def get(%ComputerPlayer{selection: selection, token: token}) do
      {selection, token}
    end

    defp best_move(_, _, available_positions, moves)
         when available_positions == [] do
      moves |> Enum.max_by(fn {_, score} -> score end)
    end

    defp best_move(
           board,
           [token, _] = tokens,
           [first_position | remaining_positions],
           moves
         ) do
      move =
        {first_position,
         minimax(
           BoardUpdate.place_token(board, {first_position, token}),
           false,
           tokens
         )}

      moves = [move | moves]
      best_move(board, tokens, remaining_positions, moves)
    end

    defp available_positions(board) do
      Enum.to_list(1..BoardInspect.size(board))
      |> Enum.filter(fn position -> BoardInspect.get(board, position) == nil end)
    end

    defp tokens(token, other_player) do
      {_, other_players_token} = Player.get(other_player)
      [token, other_players_token]
    end

    defp minimax(board, maximize, [token, other_players_token] = tokens) do
      {result, winner} = BoardInspect.outcome(board)

      cond do
        result != :in_progress ->
          scores(tokens)[winner] || scores(tokens)[result]

        maximize ->
          maximize_score(board, false, token, tokens)

        true ->
          minimize_score(board, true, other_players_token, tokens)
      end
    end

    def scores([token, other_players_token]) do
      %{
        other_players_token => -1,
        token => 1,
        :draw => 0
      }
    end

    defp assessed_moves(board, maximize, token, tokens) do
      available_positions(board)
      |> Enum.map(fn available_position ->
        {
          available_position,
          minimax(
            BoardUpdate.place_token(board, {available_position, token}),
            maximize,
            tokens
          )
        }
      end)
    end

    defp maximize_score(board, false, token, tokens) do
      {_, score} =
        assessed_moves(board, false, token, tokens)
        |> Enum.max_by(fn {_, score} -> score end)

      score
    end

    defp minimize_score(board, true, token, tokens) do
      {_, score} =
        assessed_moves(board, true, token, tokens)
        |> Enum.min_by(fn {_, score} -> score end)

      score
    end
  end
end
