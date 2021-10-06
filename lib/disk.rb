class Disk < Product
  def self.from_file(path)

    lines = File.readlines(path, encoding: 'UTF-8', chomp: true)

    self.new(
      album_title: lines[0],
      artist: lines[1],
      genre: lines[2],
      year: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end

  attr_accessor :album_title, :executor, :genre, :year

  def initialize(params)
    super

    @album_title = params[:album_title]
    @artist = params[:executor]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом #{@album_title}, #{@year}, исполнитель #{@artist}, жанр #{@genre}, #{super}"
  end

  def update(params)
    super

    @album_title = params[:album_title] if params[:album_title]
    @artist = params[:executor] if params[:executor]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end
end
