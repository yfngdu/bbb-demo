require 'bigbluebutton_api'
require 'prepare'
require 'json'
require 'net/http'

class PagesController < ActionController::Base
  def home
    prepare
    @records = []
    response = @api.get_recordings
    response[:recordings].each do |m|
      record = {}
      record[:name] = m[:name]
      record[:startTime] = m[:startTime]
      record[:endTime] = m[:endTime]
      record[:deleteID] = "delete_recording_" + m[:recordID]
      record[:rowID] = "row_" + m[:recordID]
      @records.push(record)
    end

    render 'layouts/home'
  end
end
