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
  MINS_LAPS = /(\d{1,3})\s(laps|mins)/

  def lines
    pages do |page|
      page.text.split(/\n/).each do |line|
        yield line.strip if KEYWORDS.any?{|k| line.match(k)}
      end
    end
  end

  def read
    season = nil
    lines do |line|
      rows = line.split(/[\s]{2,}/)
      if rows.size > 1
        season.tracks << [
          parse_date(rows[0]),
          clear(rows[1]),
          clear(mins_laps(rows[-1]))
        ]
      else
        yield season if season.present?
        season = OpenStruct.new name: rows.first, tracks: []
      end
    end
  end

  def parse_date(str)
    Date.parse str
  end

  def mins_laps(str)
    str =~ MINS_LAPS
    "#{$1} #{$2}"
  end

  def series
    [].tap do |result|
      read do |ser|
        result << ser
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
