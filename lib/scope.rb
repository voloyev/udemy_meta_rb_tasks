CONSTA = false 

module M
  def foo
    self
  end

  def to_s
    self.inspect + 'LOOOOOO'
  end
end

class C
  include M if CONSTA
  prepend M unless CONSTA

  def foo
    p 'I am main'
  end
end
