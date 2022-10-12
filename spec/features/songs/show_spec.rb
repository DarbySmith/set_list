# As a user,
# when I visit '/songs'
# I see each song's title and play count

require 'rails_helper'

RSpec.describe 'the song show page', type: :feature do
  it 'displays the song title' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I really like you", length: 208, play_count: 143142, artist_id: artist.id)
    song_2 = artist.songs.create!(title: "Call me maybe", length: 305, play_count: 13862, artist_id: artist.id)
    
    # visit "/songs/somethingsomething"
    # visit "/songs/show"
    visit "/songs/#{song.id}"
    
    # capybara allows us to use 'have_content' and 'page'
    expect(page).to have_content(song.title)

    expect(page).to_not have_content(song_2.title)
  end
  
  it 'displays the name of artist for the song' do 
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I really like you", length: 208, play_count: 143142)
    song_2 = artist.songs.create!(title: "Call me maybe", length: 305, play_count: 13862)
    
    visit "/songs/#{song.id}"
    # save_and_open_page # <== this opens a new page with what testing thru launchy
    expect(page).to have_content(artist.name)
  end
end

