class Module
  def change_mtd(original, extra)
    without_extra = "#{original}_without_#{extra}"
    alias_method without_extra, original

    with_extra = "#{original}_with_#{extra}"
    alias_method original, with_extra
  end

  private :change_mtd
end
