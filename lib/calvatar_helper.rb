# frozen_string_literal: true

module CalvatarHelper
  def calvatar_for(name)
    Calvatar::Avatar.generate_avatar(name)
  end
end
