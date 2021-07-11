class StudiosController < ApplicationController
    def index
        if params[:query].present?
            @studio = Studio.search_by_address(params[:query])
            if @studio.size === 0
                @studios = Studio.all
            else 
                @studios = @studio
            end
            @markers = @studios.geocoded.map do |studio|
                {
                  lat: studio.latitude,
                  lng: studio.longitude,
                  info_window: render_to_string(partial: "/studios/info_window", locals: { studio: studio }),
                  image_url: helpers.asset_url('camera.png')
                }
              end
        end
        
    
        # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
        
    end
end
