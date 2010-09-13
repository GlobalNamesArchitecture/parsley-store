require 'redis'
require 'biodiversity'


class ParsleyStore
  #database numbers for Redis
  LOCAL = 1
  SLAVE = 2
  
  def initialize
    @parser = ScientificNameParser.new
    @local = Redis.new
    @local.select(LOCAL)
  end

  def parse(scientific_name, fast = false)
    stored = @local.get(scientific_name)
    return (fast ? Marshal.load(stored) : JSON.load(stored)) if stored
    begin
      parsed = @parser.parse(scientific_name)
    rescue
      @parser = ScientificNameParser.new
      parsed = @parser.parse(scientific_name)
    end
    serialized = fast ? Marshal.dump(parsed) : parsed.to_json
    @local.set scientific_name, serialized
    parsed
  end
end
