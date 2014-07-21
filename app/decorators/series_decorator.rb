class SeriesDecorator < Draper::Decorator
  delegate_all

  def full_name
    [
      "[#{license}]",
      name
    ].join ' '
  end
end
