defmodule TicTacToe do
  alias TicTacToe.Display
  alias TicTacToe.Player
  alias TicTacToe.BoardUpdate
  alias TicTacToe.BoardInspect

  def run(state) do
    if game_over?(state) do
      show_board(state)
    else
      state
      |> show_board()
      |> play_turn()
      |> run()
    end
  end

  defp game_over?(%{board: board}) do
    {status, _winner} = BoardInspect.outcome(board)
    status != :in_progress
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
    first_player = Player.selection(first_player, board, second_player)
    move = Player.get(first_player)

    board = BoardUpdate.place_token(board, move)

    %{state | board: board, players: [second_player, first_player]}
  end
end
