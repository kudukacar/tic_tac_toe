defmodule TicTacToe.ComputerPlayerTest do
  use ExUnit.Case
  alias TicTacToe.ComputerPlayer
  alias TicTacToe.BoardUpdate
  alias TicTacToe.BoardInspect
  alias TicTacToe.Player

  defmodule SmallBoard do
    defstruct [:board_state]

    defimpl BoardUpdate do
      def place_token(
            %SmallBoard{board_state: board_state} = board,
            {position, token}
          ) do
        board_state = List.replace_at(board_state, position - 1, token)

        %{board | board_state: board_state}
      end
    end

    defimpl BoardInspect do
      def row_length(_), do: nil

      def size(_board) do
        5
      end

      def get(%SmallBoard{board_state: board_state}, position) do
        Enum.at(board_state, position - 1)
      end

      def outcome(%SmallBoard{board_state: board_state}) do
        case board_state do
          [winner, winner, winner, _, _] -> {:win, winner}
          [_, _, winner, winner, winner] -> {:win, winner}
          ["O", "O", "X", "X", "O"] -> {:draw, nil}
          ["X", "O", "X", "X", "O"] -> {:draw, nil}
          _ -> {:in_progress, nil}
        end
      end
    end
  end

  test "selects an available position" do
    assert Player.selection(
             %ComputerPlayer{token: "O"},
             %SmallBoard{board_state: ["O", "O", "X", "X", nil]},
             %ComputerPlayer{token: "X"}
           ).selection == 5
  end

  test "makes a winning move when available" do
    assert Player.selection(
             %ComputerPlayer{token: "O"},
             %SmallBoard{board_state: ["O", "O", nil, "X", nil]},
             %ComputerPlayer{token: "X"}
           ).selection == 3
  end

  test "takes a draw over a loss" do
    assert Player.selection(
             %ComputerPlayer{token: "O"},
             %SmallBoard{board_state: [nil, "O", "X", "X", nil]},
             %ComputerPlayer{token: "X"}
           ).selection == 5
  end

  test "gets the player's selection and token" do
    assert Player.get(%ComputerPlayer{selection: 4, token: "O"}) == {4, "O"}
  end
end
