class Object
  def class_tap
    yield(self) if block_given?
    inspect
  end

  def class_tap2(&block)
    instance_eval(&block) if block_given?
    inspector_classes
  end
end

class TestClassTap
  def a
    @a = 'a'
  end

  private

  def pr
    'pr'
  end
end
