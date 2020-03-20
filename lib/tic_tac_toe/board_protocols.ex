defprotocol TicTacToe.BoardUpdate do
  def place_token(board, position, token)
end

defprotocol TicTacToe.BoardInspect do
  def get(board, position)
end
