defprotocol TicTacToe.Board do
  def get(board, position)
  def place_token(board, position, token)
  def available_positions(board)
end

defimpl TicTacToe.Board, for: List do
  def get(board, position) do
    Enum.at(board, position - 1)
  end

  def place_token(board, position, token) do
    List.replace_at(board, position - 1, token)
  end

  def available_positions(board) do
    Enum.to_list(1..length(board))
    |> Enum.filter(fn x -> get(board, x) == nil end)
  end
end
