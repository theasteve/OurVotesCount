module DatetimeHelper

  def to_date(date)
    date.strftime("%m/%d/%Y")
  end

  def to_time(time)
    time.strftime("at %I:%M%p")
  end
end
