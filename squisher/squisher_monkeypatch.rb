# Monkeypatch to add squish method to arrays
class Array
  # Squishes all nested array items to the first level
  def squish filter=false
    self.each_with_object([]) do |position, squished| 
      squished.push *( position.kind_of?(Array) ? position.squish : position )
    end
  end

  # Self-assign
  def squish!
    self.replace self.squish
  end
end