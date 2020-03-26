defprotocol TicTacToe.Player do
  def selection(player, board, players)
  def get(player)
end
