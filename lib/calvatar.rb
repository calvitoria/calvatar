# frozen_string_literal: true

require_relative 'calvatar/version'
require 'calvatar_helper'

module Calvatar
  class Avatar
    DEFAULT_COLORS = [
      '#FF5733', '#33FF57', '#3357FF', '#F1C40F', '#9B59B6',
      '#E67E22', '#1ABC9C', '#2ECC71', '#3498DB', '#34495E'
    ].freeze

    DEFAULT_SIZE = 50

    def initialize(name, colors: DEFAULT_COLORS, size: DEFAULT_SIZE)
      @initials = extract_initials(name)
      @color = colors.sample
      @size = size
    end

    def generate
      svg = <<~SVG
        <svg xmlns='http://www.w3.org/2000/svg' width='#{@size}' height='#{@size}'>
          <rect width='100%' height='100%' fill='#{@color}'/>
          <text x='50%' y='50%' font-size='#{@size * 0.8}' text-anchor='middle' fill='white' dy='.3em'>#{@initials}</text>
        </svg>
      SVG
      svg.html_safe
    end

    def self.generate_avatar(name, colors: DEFAULT_COLORS, size: DEFAULT_SIZE)
      new(name, colors: colors, size: size).generate
    end

    private

    def extract_initials(name)
      name.split.map(&:chr).join.upcase
    end
  end
end
