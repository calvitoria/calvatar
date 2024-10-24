# frozen_string_literal: true

module CalvatarHelper
  def calvatar_for(name, colors: Calvatar::Avatar::DEFAULT_COLORS, size: Calvatar::Avatar::DEFAULT_SIZE)
    Calvatar::Avatar.generate_avatar(name, colors: colors, size: size)
  end
end
