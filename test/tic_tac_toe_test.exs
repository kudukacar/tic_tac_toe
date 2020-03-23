defmodule TicTacToeTest do
  use ExUnit.Case
  alias TicTacToe.Player
  alias TicTacToe.Display
  alias TicTacToe.BoardUpdate
  alias TicTacToe.BoardInspect

  defmodule HyphenPresenter do
    def present(%{board_state: board_state}) do
      board_state
      |> Enum.map(fn cell_value -> cell_value || "-" end)
      |> Enum.join()
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

  defmodule PlayerWithMoves do
    defstruct [:token, :selection, :moves]

    defimpl Player do
      def selection(
            %PlayerWithMoves{moves: [selection | moves]} = player,
            _board
          ) do
        %{player | moves: moves, selection: selection}
      end
    end
  end

  defmodule BoardWithFourSpaces do
    defstruct board_state: [nil, nil, nil, nil],
              boards: [
                ["X", nil, nil, nil],
                ["X", "O", nil, nil],
                ["X", "O", "X", nil],
                ["X", "O", "X", "O"]
              ],
              status: :in_progress

    defimpl BoardUpdate do
      def place_token(
            %{boards: [first | last], status: status} = board_with_four_spaces,
            _position,
            _token
          ) do
        board_state = first
        new_status = if !Enum.member?(board_state, nil), do: :win

        %{
          board_with_four_spaces
          | board_state: board_state,
            boards: last,
            status: new_status || status
        }
      end
    end

    defimpl BoardInspect do
      def get(_, _), do: nil
      def size(_), do: nil

      def outcome(%{board_state: board_state}) do
        if !Enum.member?(board_state, nil) do
          {:win, "X"}
        else
          {:in_progress, nil}
        end
      end
    end
  end

  test "plays the game until an outcome" do
    expected_grid = ["----", "X---", "XO--", "XOX-", "XOXO"]

    assert TicTacToe.run(%{
             board: %BoardWithFourSpaces{},
             display: %DisplayWithIO{},
             presenter: HyphenPresenter,
             players: [
               %PlayerWithMoves{token: "X", moves: [1, 3]},
               %PlayerWithMoves{token: "O", moves: [2, 4]}
             ]
           }).display.outputs == expected_grid
  end
end
