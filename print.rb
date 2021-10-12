class Print
  @all_options = [
    'List all books',
    'List all people',
    'Create a person',
    'Create a book',
    'Create a rental',
    'List all rentals for a given person id',
    'Terminate'
  ]
  def self.options
    @all_options.each_with_index { |o, i| puts "#{i + 1} #{o}" }
  end

  def self.options_size
    @all_options.size
  end

  def self.entity_info(entity)
    entity.each { |e| puts e.info }
  end

  def self.enitiy_info_if_id(entity, id)
    entity.each do |e|
      puts e.info if e.person.id.eql? id
    end
  end

  def self.entity_with_index(entity)
    entity.each_with_index do |e, i|
      puts "#{i}) #{e.info}"
    end
  end

  def self.error(err)
    puts err
  end

  def self.success(succ)
    puts succ
  end
end
