module EtabliocmsCore
  module Admin
    class StaticController < BaseController

      def index
      end

      def textile_parser
        render :text => ::RedCloth.new(params[:data]).to_html
      end

      def textile_help
        require 'lorem'
      end

    end
  end
end
