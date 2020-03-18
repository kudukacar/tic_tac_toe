defmodule TicTacToeTest do
  use ExUnit.Case
  alias TicTacToe.Player
  alias TicTacToe.Display

  defmodule HyphenPresenter do
    def present(board) do
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
    defstruct [:token, :selection]

    defimpl Player do
      def selection(%PlayerWithOne{} = player, _board) do
        player
      end
    end
  end

  test "shows every state of the board" do
    expected_grid = ["---", "X--", "XO-"]
    board = [nil, nil, nil]

    assert TicTacToe.run(%{
             board: board,
             display: %DisplayWithIO{},
             presenter: HyphenPresenter,
             players: [
               %PlayerWithOne{token: "X", selection: 1},
               %PlayerWithOne{token: "O", selection: 2}
             ]
           }).outputs == expected_grid
  end
end
