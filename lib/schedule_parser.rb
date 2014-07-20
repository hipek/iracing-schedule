class ScheduleParser < Struct.new(:file)
  class SeriesSeason < Struct.new(:name, :tracks)
    attr_accessor :season_name, :klass, :kind

    def series_name
      name.gsub(season_name, ' ').
      squeeze(' ').
      gsub(/\-\s?\-/,'-').
      strip.chomp('-').strip
    end

    def season_name
      @season_name ||= name.split(' - ').last.strip
    end
  end

  def open_file
    path = if file.respond_to?(:path)
      file.path
    else
      file
    end
    File.open(path, "rb") do |io|
      yield io
    end if File.exists? path
  end

  def pages
    open_file do |io|
      r = PDF::Reader.new(io)
      r.pages.each do |page|
        yield page
      end
    end
  end

  KEYWORDS = ['Season', 'Week', 'Class Series', 'ROAD', 'OVAL']
  BLACKLISTED_WORDS = [
    'Local enforced cautions',
    'Single file', ',',
    'Double file', 'course cautions'
  ]
  MINS_LAPS  = /(\d{1,3})\s(laps|mins)/
  NIGHT_RACE = 'Night race'

  def lines
    pages do |page|
      page.text.split(/\n/).each do |line|
        if KEYWORDS.any?{|k| line.match(k)}
          yield line.strip
        end
      end
    end
  end

  def read
    season = nil
    klass = nil
    kind = nil
    lines do |line|
      if line.match /Class Series/
        klass = line.strip 
        next
      end
      if line.match /ROAD|OVAL/
        kind = line.strip
        next
      end
      night = !!line.match(NIGHT_RACE)
      rows  = line.split(/[\s]{2,}/)

      if rows.size > 1
        season.tracks << [
          parse_date(rows[0]),
          clear(rows[1]),
          clear(mins_laps(rows[-1])),
          night
        ]
      else
        yield season if season.present?
        season = SeriesSeason.new rows.first, []
        season.season_name = @season_name
        season.kind = kind
        season.klass = klass
        @season_name ||= season.season_name
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
