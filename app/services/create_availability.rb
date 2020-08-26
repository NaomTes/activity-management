class CreateAvailability
  attr_reader :duration

  def initialize(duration)
    @duration = duration
  end

  def call
    begin
      populate_availabilities
      return true
    end
  rescue
    return false
  end

  def to_post_meridiem_time(time)
    time.strftime("%I:%M%p")
  end

  def from_post_meridiem_time(time)
    Time.parse(time).strftime("%H:%M")
  end

  def populate_availabilities
    starting_date = Date.parse(duration[:starting_date].strftime("%F"), "%Y-%m-%d")

    start_time = from_post_meridiem_time duration[:from_time].to_s
    end_time = from_post_meridiem_time duration[:to_time].to_s

    intervals = end_time.to_i - start_time.to_i <= 0 ?
      24 + end_time.to_i - start_time.to_i :
      end_time.to_i - start_time.to_i

    interval_offset = 1
    intervals /= interval_offset

    initial_time = Time.strptime(start_time, "%H:%M")
    intervals.times do
      duration.availabilities.create!(
        available_on: starting_date,
        from_time: to_post_meridiem_time(initial_time),
        to_time: to_post_meridiem_time(initial_time + interval_offset.hour),
      )
      initial_time += interval_offset.hour
    end

    from = starting_date.wday
    to = duration[:repetition_days]

    for i in 1..duration[:repetition]
      to.each do |t|
        t = t.to_i
        next_date = nil
        t % 7 - from < 0 ?
          next_date = starting_date + ((i - 1) * 7) + (t % 7 - from + 7) :
          t % 7 - from == 0 ?
          next_date = starting_date + ((i - 1) * 7) + (7) :
          next_date = starting_date + ((i - 1) * 7) + (t % 7 - from)

        initial_time = Time.strptime(start_time, "%H:%M")
        intervals.times do
          duration.availabilities.create!(
            available_on: next_date,
            from_time: to_post_meridiem_time(initial_time),
            to_time: to_post_meridiem_time(initial_time + interval_offset.hour),
          )
          initial_time += interval_offset.hour
        end
      end
    end
  end
end
