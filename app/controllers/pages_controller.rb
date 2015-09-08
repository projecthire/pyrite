class PagesController < ApplicationController
  def home
    # send data to js via gon
    gon.rails_env = Rails.env
    gon.segment_io_key = Rails.application.config.segment_io_key
  end
end
