module StylesHelper
  def join_selector(form, field)
    form.select(field, [['unset', '']] + %w(bevel miter round).map { |i| [i, i] })
  end

  def cap_selector(form, field)
    form.select(field, [['unset', '']] + %w(butt round square).map { |i| [i, i] })
  end

  def font_selector(form, field)
    form.select(field, ['DejaVu Sans Book'].map { |f| [f, f] })
  end
end
