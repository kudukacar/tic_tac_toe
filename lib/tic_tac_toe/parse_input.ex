defprotocol TicTacToe.ParseInput do
  def to_integer(input)
end

defimpl TicTacToe.ParseInput, for: BitString do
  def to_integer(input) do
    try do 
      String.to_integer(input)
    rescue
      ArgumentError -> 0
    end
  end
end
