module Location4meshcode
  class Point
    attr_reader :latitude, :longitude

    def initialize(latitude:, longitude:)
      # 1度 = 60分なので緯度はここで単位を分に変換しておく
      @latitude = (latitude.to_f) * 60
      @longitude = longitude.to_f
    end

    def meshcode(level:)
      call_method = "meshcode_level#{level}"
      send(call_method.to_sym)
    end

    private

    def meshcode_level1
      # 上2桁
      # 赤道から上方向に40分ごとに振っている通し番号。
      # 1度(=60分)あたり1.5区画分(60/40 = 1.5)となるので緯度を1.5倍したものが1次メッシュコードの上2桁
      lat = (@latitude / 40).to_i
      # 下2桁
      # 東経100度から1度ごとに通し番号を振っているので経度から100を引いたものが1次メッシュコードの下2桁となる。
      lon = @longitude.to_i - 100
      "#{lat}#{lon}"
    end

    def meshcode_level2
      # 1次メッシュコードの余りを8分区切りにした1つ
      lat = (level1_lat_remainder / 5).to_i
      lon = (level1_lon_remainder / 7.5).to_i
      # 1次メッシュの結果と結合
      meshcode_level1 + "#{lat}#{lon}"
    end

    def meshcode_level3
      # 2次メッシュ区画を10等分
      lat = ((level2_lat_remainder * 1) / 0.5).to_i
      lon = ((level2_lon_remainder * 1) / 0.75).to_i

      meshcode_level2 + "#{lat}#{lon}"
    end

    def level1_lat_remainder
      @latitude % 40
    end

    def level1_lon_remainder
      ((@longitude - @longitude.to_i) * 60)
    end

    def level2_lat_remainder
      level1_lat_remainder % 5
    end

    def level2_lon_remainder
      ((@longitude - @longitude.to_i) * 60) % 7.5
    end
  end
end
