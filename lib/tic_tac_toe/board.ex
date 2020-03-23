defmodule TicTacToe.Board do
  alias TicTacToe.Board
  alias TicTacToe.BoardInspect
  alias TicTacToe.BoardUpdate

  defstruct [:board_state, status: :in_progress, winner: nil]

  defimpl BoardInspect do
    def get(%Board{board_state: board_state}, position) do
      Enum.at(board_state, position - 1)
    end

    def size(%Board{board_state: board_state}) do
      length(board_state)
    end

    def outcome(%Board{status: status, winner: winner}) do
      {status, winner}
    end
  end

  defimpl BoardUpdate do
    def place_token(
          %Board{board_state: board_state, status: status} = board,
          position,
          token
        ) do
      board_state = List.replace_at(board_state, position - 1, token)
      status = outcome(board_state) || status
      winner = winner(board_state)

      %{
        board
        | board_state: board_state,
          status: status,
          winner: winner
      }
    end

    defp rows(board_state) do
      row_length = length(board_state) |> :math.sqrt() |> trunc()
      1..length(board_state) |> Enum.to_list() |> Enum.chunk_every(row_length)
    end

    defp columns(rows) do
      rows |> Enum.zip() |> Enum.map(&Tuple.to_list/1)
    end

    defp left_diagonal(rows) do
      rows
      |> Enum.with_index()
      |> Enum.map(fn {row, index} -> Enum.at(row, index) end)
    end

    defp right_diagonal(rows) do
      Enum.reverse(rows) |> left_diagonal
    end

    defp winner(board_state) do
      rows = rows(board_state)

      (rows ++
         columns(rows) ++ [left_diagonal(rows)] ++ [right_diagonal(rows)])
      |> Enum.filter(fn [first_position | remaining_positions] ->
        Enum.all?(remaining_positions, fn x ->
          Enum.at(board_state, x - 1) ==
            Enum.at(board_state, first_position - 1)
        end)
      end)
      |> List.flatten()
      |> winning_token(board_state)
    end

    defp winning_token(winning_positions, board_state) do
      if !Enum.empty?(winning_positions) do
        Enum.at(board_state, List.first(winning_positions) - 1)
      end
    end

    defp draw?(board_state) do
      !Enum.member?(board_state, nil)
    end

    defp outcome(board_state) do
      cond do
        winner(board_state) -> :win
        draw?(board_state) -> :draw
        true -> nil
      end
    end
  end
end
