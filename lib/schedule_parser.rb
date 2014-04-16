class ScheduleParser < Struct.new(:file)
  def pages
    File.open(file, "rb") do |io|
      r = PDF::Reader.new(io)
      r.pages.each do |page|
        yield page
      end
    end
  end

  KEYWORDS = %w'Season Week'
  BLACKLISTED_WORDS = [
    'Local enforced cautions',
    'Single file', ',',
    'Double file', 'course cautions'
  ]
  MINS_LAPS = /(\d{1,2})\s(laps|mins)/

  def lines
    pages do |page|
      page.text.split(/\n/).each do |line|
        yield line.strip if KEYWORDS.any?{|k| line.match(k)}
      end
    end
  end

  def read
    lines do |line|
      rows = line.split(/[\s]{2,}/)
      if rows.size > 1
        rows[-1] =~ MINS_LAPS
        # p [rows[0], rows[1], "#{$1} #{$2}"].map{|t| clear(t)}
      else
        # p rows
      end
    end
  end

  def clear(text)
    BLACKLISTED_WORDS.each do |word|
      text.gsub!(word, ' ')
    end
    text.squeeze(' ').strip
  end
end
