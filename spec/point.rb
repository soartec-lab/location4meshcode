require 'spec_helper'

RSpec.describe Location4meshcode::Point do
  let(:location) { Location4meshcode::Point.new(latitude: '35.679368', longitude: '139.789769') } 
  let(:location_2) { Location4meshcode::Point.new(latitude: '35.7007777',longitude: '139.71475') } 

  describe '#meshcode(level:)' do
    it "メッシュコードが正しく取得できる事" do
      expect(location.meshcode(level: 1)).to eq("5339")
      expect(location.meshcode(level: 2)).to eq("533946")
      expect(location.meshcode(level: 3)).to eq("53394613")
    end
    it "メッシュコードが正しく取得できる事その2" do
      expect(location_2.meshcode(level: 1)).to eq("5339")
      expect(location_2.meshcode(level: 2)).to eq("533945")
      expect(location_2.meshcode(level: 3)).to eq("53394547")
    end
  end

  describe '#level1_lat_remainder' do
    it '結果が正しい事' do
      expect(location.send(:level1_lat_remainder)).to eq(20.76207999999997)
      expect(location_2.send(:level1_lat_remainder)).to eq(22.046662000000197)
    end
  end

  describe '#level1_lon_remainder' do
    it '結果が正しい事' do
      expect(location.send(:level1_lon_remainder)).to eq(47.38614000000041)
      expect(location_2.send(:level1_lon_remainder)).to eq(42.88500000000056)
    end
  end

  describe '#level2_lat_remainder' do
    it '結果が正しい事' do
      expect(location.send(:level2_lat_remainder)).to eq(0.762079999999969)
      expect(location_2.send(:level2_lat_remainder)).to eq(2.0466620000001967)
    end
  end

  describe '#level2_lon_remainder' do
    it '結果が正しい事' do
      expect(location.send(:level2_lon_remainder)).to eq(2.3861400000004096)
      expect(location_2.send(:level2_lon_remainder)).to eq(5.385000000000559)
    end
  end
end
