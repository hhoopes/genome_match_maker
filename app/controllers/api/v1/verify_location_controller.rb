module Api
  module V1
    class VerifyLocationController < ApiController

      def show
        validity = {}
        location = Location.find_by(position: params[:id])
        if location.nil?
          validity["validity"] = "false"
        else
          validity["validity"] = "true"
        end
        respond_with validity 
      end

    end
  end
end
