class Show
  def self.display_board(board)
    system "clear" or system "cls"
    puts "  1 2 3"
    ('A'..'C').each do |row|
      print "#{row} "
      (1..3).each do |col|
        print "#{board["#{row}#{col}"]} "
      end
      puts
    end
  end
end

