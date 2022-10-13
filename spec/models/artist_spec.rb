require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    # it { should validate_presence_of :name}
    it {should have_many :songs}
  end

  describe 'instance methods' do
    
    describe '#average_song_length' do
      before :each do 
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8544)
        @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 745, play_count: 6584)
        @other_song = @prince.songs.create!(title: 'Another Prince Song', length: 1, play_count: 4846)
      end
      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(530.33)
      end
    end
  end
end