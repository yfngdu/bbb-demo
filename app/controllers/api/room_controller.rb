require 'bigbluebutton_api'
require 'prepare'

class Api::RoomController < ActionController::API
  def join
    begin
      prepare
      num = rand(1000)
      meeting_name = "Demo Meeting"
      meeting_id = "demo-meeting-#{num}"
      moderator_name = params[:name]
      attendee_name = params[:name]
      record = params[:record]
      record_opt = (record == "1") ? true : false

      # create meeting
      unless @api.is_meeting_running?(meeting_id)
        options = { :moderatorPW => "54321",
          :attendeePW => "12345",
          :welcome => 'Welcome to my meeting',
          :dialNumber => '1-800-000-0000x00000#',
          :logoutURL => 'http://localhost:3000',
          :record => record_opt,
          :maxParticipants => 25 }
        @api.create_meeting(meeting_name, meeting_id, options)
        url = @api.join_meeting_url(meeting_id, moderator_name, options[:moderatorPW])

        redirect_to url
      end

      rescue Exception => ex
        puts "Failed with error #{ex.message}"
        puts ex.backtrace
    end
  end
end
