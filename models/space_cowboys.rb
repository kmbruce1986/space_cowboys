require("pg")

class SpaceCowboys

attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @bounty_value = options['bounty_value'].to_i
    @danger_level = options['danger_level']
    @cashed_in = options['cashed_in']
  end

  def save()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "INSERT INTO space_cowboys (name, bounty_value, danger_level, cashed_in) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @bounty_value, @danger_level, @cashed_in]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    @id = result[0]['id'].to_i()
    db.close()
  end

end
