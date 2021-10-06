# frozen_string_literal: true

class Corrector
  def correct_name(name)
    name.capitalize[0, 10]
  end
end
