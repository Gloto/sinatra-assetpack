module Sinatra::AssetPack
  class SassEngine < Engine
    def css(str, options={})
      options = {:style => :compressed}.merge(options)
      Tilt.new("scss", options) { str }.render
    rescue LoadError
      nil
    end
  end

  Compressor.register :css, :sass, SassEngine
end
