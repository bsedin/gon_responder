require "gon_responder/version"

module Responders
  module GonResponder
    def initialize(controller, resources, options={})
      super
      @gon = options.delete(:gon)
    end

    def to_html
      set_gon! if @gon
      super
    end

  protected

    def set_gon!
      case @gon
      when Symbol, String
        controller.gon.send(@gon)
      when Hash
        @gon.each do |meth, opts|
          controller.gon.send(meth, opts)
        end
      end
    end
  end
end
