
r2d2_str = File.open('r2d2.txt', &:read)
background_str = File.open('background.txt', &:read)
r2d2 = r2d2_str.split(/\n/)
background = background_str.split(/\n/)

DISTANCE = 45
pic = []

loop do
  r2d2.length.upto(DISTANCE) do
    r2d2.map! { |r2d2_line| r2d2_line.rjust(r2d2_line.length + 1) }
    pic = background_str.split(/\n/)
    sleep 0.03
    system 'clear'

    (0...(r2d2.length)).each do |i|
      (0...(r2d2[i].length)).each do |j|
        pic[i][j] = r2d2[i][j] if background[i][j] == ' '
      end
    end

    puts pic
  end

  DISTANCE.downto(r2d2.length) do
    r2d2.map! { |r2d2_line| r2d2_line.slice!(1..-1) }
    pic = background_str.split(/\n/)
    sleep 0.03
    system 'clear'

    (0..(r2d2.length - 1)).each do |i|
      (0..(r2d2[i].length - 1)).each do |j|
        pic[i][j] = r2d2[i][j] if background[i][j] == ' '
      end
    end

    puts pic
  end
end
