defmodule TicTacToeTest do
  use ExUnit.Case
  alias TicTacToe.Player

  defmodule HyphenPresenter do
    def present(board) do
      board |> Enum.map(fn cell_value -> cell_value || "-" end) |> Enum.join()
    end
  end

  defmodule DisplayWithIO do
    def output(message, messages \\ []) do
      messages ++ [message]
    end

    def input(_message) do
      "1"
    end
  end

  defmodule PlayerWithOne do
    defstruct token: ""

    defimpl Player do
      def selection(%PlayerWithOne{}, _opts) do
        1
      end
    end
  end

  test "shows every state of the board" do
    expected_grid = ["---", "X--"]
    board = [nil, nil, nil]

    assert TicTacToe.run(
             board: board,
             display: DisplayWithIO,
             presenter: HyphenPresenter,
             player: %PlayerWithOne{token: "X"}
           ) == expected_grid
  end
end
