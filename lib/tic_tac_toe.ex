defmodule TicTacToe do
  alias TicTacToe.Display
  alias TicTacToe.Player
  alias TicTacToe.BoardUpdate
  alias TicTacToe.BoardOutcome

  def run(%{board: %{game_over: game_over}} = state) when game_over do
    show_board(state)
  end

  def run(state) do
    state
    |> show_board()
    |> play_turn()
    |> run()
  end

  defp show_board(
         %{board: board, presenter: presenter, display: display} = state
       ) do
    formatted_board = board |> presenter.present()

    %{state | display: Display.output(display, formatted_board)}
  end

  defp play_turn(
         %{players: [first_player, second_player], board: board} = state
       ) do
    first_player = Player.selection(first_player, board)

    board =
      BoardUpdate.place_token(board, first_player.selection, first_player.token)
      |> BoardOutcome.game_over?()

    %{state | board: board, players: [second_player, first_player]}
  end
end
