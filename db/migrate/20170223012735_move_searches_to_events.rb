class MoveSearchesToEvents < ActiveRecord::Migration
  def change
    if defined? Search
      Search.all.each do |search|
        event = Event.new
        if search.author == 'Adriana Sleigh'
          event.created_by = 6
        elsif search.author == 'Scott Houser'
          event.created_by = 2
        end
        event.description = search.body
        event.reference = search.title
        event.start_on = search.search_date
        event.event_type = 'incident'
        event.save
      end
    end
  end
end
