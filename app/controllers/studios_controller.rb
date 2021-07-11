class StudiosController < ApplicationController
    def index
        if params[:query].present?
            @studio = Studio.search_by_address(params[:query])
            if @studio.size === 0
                @studios = Studio.all
            else 
                @studios = @studio
            end
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
    
    def new
        @studio = Studio.new
    end

    def create
        @studio = Studio.new(studio_params)

        if @studio.save
            redirect_to studios_path
        else
            render :new
        end
    end

    private
    
    def studio_params
        params.require(:studio).permit(:address, :name, :photo)
    end
end
