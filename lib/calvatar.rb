# frozen_string_literal: true

require_relative 'calvatar/version'
require 'calvatar_helper'

module Calvatar
  class Avatar
    COLORS = [
      '#FF5733', '#33FF57', '#3357FF', '#F1C40F', '#9B59B6',
      '#E67E22', '#1ABC9C', '#2ECC71', '#3498DB', '#34495E'
    ]

    def initialize(name)
      @initials = extract_initials(name)
      @color = COLORS.sample
    end

    def generate
      svg = <<~SVG
        <svg xmlns='http://www.w3.org/2000/svg' width='100' height='100'>
          <rect width='100' height='100' fill='#{@color}'/>
          <text x='50%' y='50%' font-size='40' text-anchor='middle' fill='white' dy='.3em'>#{@initials}</text>
        </svg>
      SVG
      svg.html_safe # Ensure the output is HTML safe for Rails
    end

    def self.generate_avatar(name)
      new(name).generate
    end

    private

    def extract_initials(name)
      name.split.map(&:chr).join.upcase # Get initials from the name
    end
  end
end
