module StylesHelper
  def join_selector(form, field)
    form.select(field, [['unset', '']] + %w(bevel miter round).map { |i| [i, i] })
  end
end
