defmodule TicTacToe do
  alias TicTacToe.Display
  alias TicTacToe.Player
  alias TicTacToe.Board

  def run(state) do
    state
    |> show_board()
    |> play_turn()
    |> show_board()
    |> play_turn()
    |> show_board()
    |> Map.get(:display)
  end

  defp show_board(
         %{board: board, presenter: presenter, display: display} = state
       ) do
    formatted_board = board |> presenter.present()

    %{state | display: Display.output(display, formatted_board)}
  end

  defp play_turn(%{players: [first_player, second_player], board: board} = state) do
    first_player = Player.selection(first_player, board)
    board = Board.place_token(board, first_player.selection, first_player.token)
    %{state | board: board, players: [second_player, first_player]}
  end
end
