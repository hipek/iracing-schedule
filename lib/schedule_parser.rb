class ScheduleParser < Struct.new(:file)
  attr_accessor :season, :license, :race_type, :cars

  class SeriesSeason < Struct.new(:name, :tracks, :cars)
    attr_accessor :season_name, :license, :race_type

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
    last = ''
    pages do |page|
      page.text.split(/\n/).each do |line|
        next if line.blank?
        if KEYWORDS.any?{|k| line.match(k)}
          last = line
          yield line.strip
        elsif last.match /Season/
          self.cars = line.strip.split(',')
          last = ''
        end
      end
    end
  end

  def read
    lines do |line|
      if line.match /Class Series/
        self.license = line.strip.split('Class').first.strip
        next
      end
      if line.match /ROAD|OVAL/
        self.race_type = line.strip
        next
      end

      night = !!line.match(NIGHT_RACE)
      rows  = line.split(/[\s]{2,}/)

      if rows.size > 1
        season.cars ||= cars.map(&:strip)
        season.tracks << [
          parse_date(rows[0]),
          clear(rows[1]),
          clear(mins_laps(rows[-1])),
          night
        ]
      else
        yield season if season.present?
        set_season(rows)
      end
    end
  end

  def set_season(rows)
    self.season = SeriesSeason.new rows.first, []
    season.season_name = @season_name
    season.race_type = race_type
    season.license = license
    @season_name ||= season.season_name
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
