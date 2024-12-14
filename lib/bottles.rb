class Bottles
  def initialize
  end

  def verse(x)
    <<-EOS
#{bot_b4(x).to_s.capitalize} #{bot_text(x)} of beer on the wall, #{bot_b4(x)} #{bot_text(x)} of beer.
#{break_r_buy(x)}, #{bot_b4(x-1)} #{bot_text(x-1)} of beer on the wall.
EOS
  end

  def verses(x,y)
    txt = ''
    (y..x).reverse_each.with_index do |i, idx|
      txt << empty_line if idx > 0
      txt << verse(i)
    end
    txt
  end

  def song
    verses(99, 0)
  end

  private 
  
  def empty_line
    <<-EOS

EOS
  end
  def bot_text(x)
    return 'bottle' if x == 1

    'bottles'
  end

  def bot_b4(x)
    return 'no more' if x == 0

    return '99' if x< 0
    x
  end

  def break_r_buy(x)
    return "Take #{x == 1 ? 'it': 'one'} down and pass it around" if x != 0

    "Go to the store and buy some more"
  end
end