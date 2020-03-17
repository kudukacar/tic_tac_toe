defmodule TicTacToe do
  alias TicTacToe.Display
  alias TicTacToe.Presenter
  alias TicTacToe.Player
  alias TicTacToe.HumanPlayer
  alias TicTacToe.Board

  def run(opts \\ []) do
    board = Keyword.get(opts, :board, List.duplicate(nil, 9))
    display = Keyword.get(opts, :display, Display)
    presenter = Keyword.get(opts, :presenter, Presenter)
    player = Keyword.get(opts, :player, %HumanPlayer{token: "X"})

    state = show_board(board, presenter, display)
    play_turn(player, board) |> show_board(presenter, display, state)
  end

  defp show_board(board, presenter, display, state \\ []) do
    board |> presenter.present() |> display.output(state)
  end

  defp play_turn(player, board) do
    selection = Player.selection(player)
    Board.place_token(board, selection, player.token)
  end
end
