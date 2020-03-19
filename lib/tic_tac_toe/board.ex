defmodule TicTacToe.Board do
  alias TicTacToe.Board

  defstruct [:board, :available_positions, :position_value, game_over: false]

  defimpl TicTacToe.BoardInspect do
    def get(%Board{board: board} = board_data, position) do
      %{board_data | position_value: Enum.at(board, position - 1)}
    end
  end

  defimpl TicTacToe.BoardUpdate do
    def place_token(%Board{board: board} = board_data, position, token) do
      %{board_data | board: List.replace_at(board, position - 1, token)}
    end
  end

  defimpl TicTacToe.BoardState do
    def available_positions(%Board{board: board} = board_data) do
      %{
        board_data
        | available_positions:
            Enum.to_list(1..length(board))
            |> Enum.filter(fn x -> Enum.at(board, x - 1) == nil end)
      }
    end
  end

  defimpl TicTacToe.BoardOutcome do
    def game_over?(%Board{board: board} = board_data) do
      %{board_data | game_over: !Enum.any?(board, fn x -> x == nil end)}
    end
  end
end
