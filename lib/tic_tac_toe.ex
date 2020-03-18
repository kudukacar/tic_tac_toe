defmodule TicTacToe do
  alias TicTacToe.Display
  alias TicTacToe.Console
  alias TicTacToe.Presenter
  alias TicTacToe.Player
  alias TicTacToe.HumanPlayer
  alias TicTacToe.Board

  def run(opts \\ []) do
    board = Keyword.get(opts, :board, List.duplicate(nil, 9))
    display = Keyword.get(opts, :display, %Console{})
    presenter = Keyword.get(opts, :presenter, Presenter)
    player = Keyword.get(opts, :player, %HumanPlayer{token: "X"})

    new_display = %{display | state: show_board(board, presenter, display)}
    play_turn(player, board) |> show_board(presenter, new_display)
  end

  defp show_board(board, presenter, display) do
    formatted_board = board |> presenter.present()
    Display.output(display, formatted_board)
  end

  defp play_turn(player, board) do
    selection = Player.selection(player)
    Board.place_token(board, selection, player.token)
  end
end
