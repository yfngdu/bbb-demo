require 'bigbluebutton_api'
require 'prepare'

class Api::RecordingController < ApplicationController

  # DELETE /recordings/2e76a97114df477ecb211abacbd689a016b4d71f-1567792826570
  def destroy
    prepare
    @api.delete_recordings([params[:id]])
  end

end
