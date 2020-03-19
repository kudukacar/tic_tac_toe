defprotocol TicTacToe.BoardUpdate do
  def place_token(board, position, token)
end

defprotocol TicTacToe.BoardState do
  def available_positions(board)
end

defprotocol TicTacToe.BoardInspect do
  def get(board, position)
end

defprotocol TicTacToe.BoardOutcome do
  def game_over?(board)
end
