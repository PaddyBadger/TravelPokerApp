atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @decks.each do |item|
    next if item.updated_at.blank?

    feed.entry( item ) do |entry|
      entry.url deck_url(item)
      entry.title item.title
      entry.image item.image, :type => 'html'
      entry.description item.description, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

      entry.author do |author|
        (author.name entry.author_name)
      end
    end
  end
end