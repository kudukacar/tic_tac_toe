defmodule TicTacToeTest do
  use ExUnit.Case
  alias TicTacToe.Player
  alias TicTacToe.Display
  alias TicTacToe.BoardUpdate
  alias TicTacToe.BoardOutcome

  defmodule HyphenPresenter do
    def present(%{board: board}) do
      board |> Enum.map(fn cell_value -> cell_value || "-" end) |> Enum.join()
    end
  end

  defmodule DisplayWithIO do
    defstruct outputs: []

    defimpl Display do
      def output(%DisplayWithIO{outputs: outputs} = display, message) do
        %{display | outputs: outputs ++ [message]}
      end

      def input(_display, _message) do
      end
    end
  end

  defmodule PlayerWithOne do
    defstruct [:token, :selection, :moves]

    defimpl Player do
      def selection(%PlayerWithOne{moves: [selection | moves]} = player, _board) do
        %{player | moves: moves, selection: selection}
      end
    end
  end

  defmodule BoardWithFourSpaces do
    defstruct board: [nil, nil, nil, nil],
              boards: [
                ["X", nil, nil, nil],
                ["X", "O", nil, nil],
                ["X", "O", "X", nil],
                ["X", "O", "X", "O"]
              ],
              game_over: false

    defimpl BoardUpdate do
      def place_token(
            %{boards: [first | last]} = board_with_four_spaces,
            _position,
            _token
          ) do
        %{board_with_four_spaces | board: first, boards: last}
      end
    end

    defimpl BoardOutcome do
      def game_over?(%{board: board} = board_with_four_spaces) do
        %{board_with_four_spaces | game_over: !Enum.member?(board, nil)}
      end
    end
  end

  test "plays the game until its over" do
    expected_grid = ["----", "X---", "XO--", "XOX-", "XOXO"]

    assert TicTacToe.run(%{
             board: %BoardWithFourSpaces{},
             display: %DisplayWithIO{},
             presenter: HyphenPresenter,
             players: [
               %PlayerWithOne{token: "X", moves: [1, 3]},
               %PlayerWithOne{token: "O", moves: [2, 4]}
             ]
           }).display.outputs == expected_grid
  end
end
