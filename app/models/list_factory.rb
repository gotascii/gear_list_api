class ListFactory
  def initialize(params)
    @from_list_id = params.delete(:from_list_id)
    @params = params
  end

  def create
    @list = List.new(@params)
    populate_picks if from_list_id?
    @list.save
    @list
  end

  def from_list_id?
    !@from_list_id.blank?
  end

  def from_list
    @from_list ||= List.find(@from_list_id)
  end

  def populate_picks
    from_list.picks.each do |p|
      attrs = p.attributes.dup
      attrs.delete("id")
      @list.picks << Pick.new(attrs)
    end
  end
end
