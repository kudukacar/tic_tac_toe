defprotocol TicTacToe.BoardUpdate do
  def place_token(board, move)
end

defprotocol TicTacToe.BoardInspect do
  def get(board, position)
  def size(board)
  def row_length(board)
  def outcome(board)
end
