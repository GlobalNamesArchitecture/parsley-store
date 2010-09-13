require 'redis'
require 'biodiversity'


class ParsleyStore
  #database numbers for Redis
  LOCAL = 1
  SLAVE = 2
  
  def initialize(local_db = LOCAL, slave_db = SLAVE)
    @parser = ScientificNameParser.new
    @local = Redis.new
    @local.select(local_db)
    # slave replication is not set up yet, so I comment it out
    # @slave = Redis.new
    # @slave.select(slave_db)
  end

  def parse(scientific_name)
    stored = @local.get(scientific_name)
    return JSON.parse(stored, :symbolize_names => true) if stored
    begin
      parsed = @parser.parse(scientific_name)
    rescue
      @parser = ScientificNameParser.new
      parsed = @parser.parse(scientific_name)
    end
    serialized = parsed.to_json
    @local.set scientific_name, serialized
    parsed
  end
end
