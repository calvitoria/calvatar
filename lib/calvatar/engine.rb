# frozen_string_literal: true

module Calvatar
  class Engine < ::Rails::Engine
    isolate_namespace Calvatar

    initializer 'calvatar.helper' do
      ActionView::Base.include CalvatarHelper
    end
  end
end
