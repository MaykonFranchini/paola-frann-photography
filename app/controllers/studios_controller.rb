class StudiosController < ApplicationController
    def index
        @studios = Studio.all
    
        # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
        @markers = @studios.geocoded.map do |studio|
          {
            lat: studio.latitude,
            lng: studio.longitude,
            info_window: render_to_string(partial: "/studios/info_window", locals: { studio: studio }),
            image_url: helpers.asset_url('camera.png')
          }
        end
    end
end
