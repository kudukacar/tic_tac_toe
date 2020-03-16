defprotocol TicTacToe.Board do
  def get(board, position)
end

defimpl TicTacToe.Board, for: List do
  def get(board, position) do
    Enum.at(board, position - 1)
  end
end
