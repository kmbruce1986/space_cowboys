require("pg")

class SpaceCowboys

  attr_reader :id
  attr_accessor :name, :bounty_value, :danger_level, :cashed_in

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

  def update()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "UPDATE space_cowboys SET (name, bounty_value, danger_level, cashed_in) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @bounty_value, @danger_level, @cashed_in, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "DELETE FROM space_cowboys WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def SpaceCowboys.find_by_name(name)
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "SELECT * FROM space_cowboys WHERE name = '#{name}'"
    db.prepare("find_by_name", sql)
    cowboy = db.exec_prepared("find_by_name")
    db.close()
    # return cowboy
    if cowboy.count != 0
      return SpaceCowboys.new(cowboy[0])
    else
      return nil
    end
  end

  def SpaceCowboys.find_by_id(id)
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "SELECT * FROM space_cowboys WHERE id = '#{id}'"
    db.prepare("find_by_id", sql)
    cowboy = db.exec_prepared("find_by_id")
    db.close()
    # return cowboy
    if cowboy.count != 0
      return SpaceCowboys.new(cowboy[0])
    else
      return nil
    end
  end

  end
