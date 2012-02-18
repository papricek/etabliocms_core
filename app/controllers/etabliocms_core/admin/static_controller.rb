module EtabliocmsCore
  module Admin
    class StaticController < BaseController

      def textile_parser
        render :text => RedCloth.new(params[:data]).to_html
      end

    end
  end
end
