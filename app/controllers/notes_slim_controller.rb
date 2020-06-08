require 'net/http'

class NotesSlimController < ApplicationController
  def index
    url = URI.parse('http://www.mocky.io/v2/5eda5f8f330000560079ebbf')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    
    @notes = JSON.parse(res.body, object_class: OpenStruct)
  end
end
