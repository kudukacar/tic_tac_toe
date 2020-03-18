defprotocol TicTacToe.Board do
  def get(board, position)
  def place_token(board, position, token)
end

defimpl TicTacToe.Board, for: List do
  def get(board, position) do
    Enum.at(board, position - 1)
  end

  def place_token(board, position, token) do
    List.replace_at(board, position - 1, token)
  end
end
