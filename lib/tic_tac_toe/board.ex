defmodule TicTacToe.Board do
  alias TicTacToe.Board

  defstruct [:board_state, :position_value, game_over: false]

  defimpl TicTacToe.BoardInspect do
    def get(%Board{board_state: board_state} = board, position) do
      %{board | position_value: Enum.at(board_state, position - 1)}
    end
  end

  defimpl TicTacToe.BoardUpdate do
    def place_token(
          %Board{board_state: board_state} = board,
          position,
          token
        ) do
      board_state = List.replace_at(board_state, position - 1, token)

      %{
        board
        | board_state: board_state,
          game_over: !Enum.any?(board_state, fn x -> x == nil end)
      }
    end
  end
end
