module DatetimeHelper

  def to_date(date)
    date.strftime("%m/%d/%Y")
  end

  def to_time(time)
    time.strftime("at %I:%M%p")
  end

  def to_day(day)
    day.strftime("%d")
  end

  def to_month(month)
    month.strftime("%B")
  end

  def to_year(year)
    year.strftime("%Y")
  end
end
