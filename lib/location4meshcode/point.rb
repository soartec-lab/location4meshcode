module Location4meshcode
  class Point
    attr_reader :latitude, :longitude

    def initialize(latitude, longitude)
      @latitude = latitude.to_f
      @longitude = longitude.to_f
    end

    def meshcode_level1
      # 上2桁
      # 赤道から上方向に40分ごとに振っている通し番号。
      # 1度(=60分)あたり1.5区画分(60/40 = 1.5)となるので緯度を1.5倍したものが１次メッシュコードの上2桁
      lat = (@latitude * 1.5).to_i
      # 下2桁
      # 東経100度から1度ごとに通し番号を振っているので経度から100を引いたものが１次メッシュコードの下2桁となる。
      lon = @longitude.to_i - 100
      "#{lat}#{lon}"
    end
  end
end
