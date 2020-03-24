defmodule TicTacToe.Board do
  alias TicTacToe.Board
  alias TicTacToe.BoardInspect
  alias TicTacToe.BoardUpdate

  defstruct [:board_state]

  def new(size) do
    %Board{board_state: List.duplicate(nil, size)}
  end

  defimpl BoardInspect do
    def get(%Board{board_state: board_state}, position) do
      Enum.at(board_state, position - 1)
    end

    def size(%Board{board_state: board_state}) do
      length(board_state)
    end

    def row_length(%Board{} = board) do
      size(board) |> :math.sqrt() |> trunc()
    end

    def outcome(%Board{board_state: board_state} = board) do
      winner = winner(board)

      status =
        cond do
          winner -> :win
          draw?(board_state) -> :draw
          true -> :in_progress
        end

      {status, winner}
    end

    defp rows(%Board{} = board) do
      number_of_positions = size(board)
      row_length = row_length(board)
      1..number_of_positions |> Enum.to_list() |> Enum.chunk_every(row_length)
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

    defp winner(%Board{board_state: board_state} = board) do
      rows = rows(board)

      (rows ++
         columns(rows) ++ [left_diagonal(rows)] ++ [right_diagonal(rows)])
      |> winning_line(board)
      |> winning_token(board_state)
    end

    defp winning_line(lines, board) do
      lines
      |> Enum.filter(fn [first_position | remaining_positions] ->
        Enum.all?(remaining_positions, fn x ->
          get(board, x) == get(board, first_position)
        end)
      end)
      |> List.flatten()
    end

    defp winning_token(winning_positions, board_state) do
      if !Enum.empty?(winning_positions) do
        Enum.at(board_state, List.first(winning_positions) - 1)
      end
    end

    defp draw?(board_state) do
      !Enum.member?(board_state, nil)
    end
  end

  defimpl BoardUpdate do
    def place_token(
          %Board{board_state: board_state} = board,
          {position, token}
        ) do
      board_state = List.replace_at(board_state, position - 1, token)

      %{board | board_state: board_state}
    end
  end
end
