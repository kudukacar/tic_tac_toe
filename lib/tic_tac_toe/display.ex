defprotocol TicTacToe.Display do
  def output(state, message)
  def input(state, message)
end
