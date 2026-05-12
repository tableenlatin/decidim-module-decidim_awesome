# frozen_string_literal: true

module Decidim
  module DecidimAwesome
    # Abstract component class for components without any admin controllers (only settings)
    class UtilsController < DecidimAwesome::ApplicationController
      def form_builder_i18n
        lang = params[:lang].presence || params[:locale].presence || I18n.locale
        lang = lang.to_s.delete_suffix(".lang")
        folder = "app/packs/src/vendor/form_builder_langs/"
        file = Decidim::DecidimAwesome::Engine.root.join(folder, "#{lang}.lang")
        file = Dir[Decidim::DecidimAwesome::Engine.root.join(folder, "#{lang}-*.lang")].first unless File.exist?(file)
        file = Decidim::DecidimAwesome::Engine.root.join(folder, "en-US.lang") unless file && File.exist?(file)
        render plain: File.read(file)
      end
    end
  end
end
