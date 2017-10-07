# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |array|
    pos1 = board[array[0]]
    pos2 = board[array[1]]
    pos3 = board[array[2]]
    if pos1 == pos2 && pos1 == pos3 && pos1 != " " && pos1 != ""
      return array
    end
  end
  return false
end

def full?(board)
  counter = 0
  board.each do |take|
    if !position_taken?(board, counter)
      return false
    end
    counter += 1
  end
  return true
end

def draw?(board)
  WIN_COMBINATIONS.each do |array|
    pos1 = board[array[0]]
    pos2 = board[array[1]]
    pos3 = board[array[2]]
    if pos1 == pos2 && pos1 == pos3
      return false
    elsif pos1 == " " || pos2 == " " || pos3 == " "
      return false
    end
  end
  return true
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  else
    false
  end
end

def winner(board)
  if won?(board)
    WIN_COMBINATIONS.each do |array|
      pos1 = board[array[0]]
      pos2 = board[array[1]]
      pos3 = board[array[2]]
      if pos1 == pos2 && pos1 == pos3 && pos1 != " " && pos1 != ""
        return pos1
      end
    end
  end
end
