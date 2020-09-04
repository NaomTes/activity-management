class CreateAvailability
  attr_reader :duration
  attr_reader :interval_offset

  def initialize(duration)
    @duration = duration
    @interval_offset = duration.slots_offset
  end

  def call
    populate_availabilities
  end

  def from_post_meridiem_time(time)
    time.strftime("%H:%M")
  end

  def create_availabilities(start_time, date, intervals)
    initial_time = start_time.to_time

    intervals.times do
      begin
        duration.availabilities.create!(
          provider_id: duration.provider_id,
          available_on: date,
          from_time: from_post_meridiem_time(initial_time),
          to_time: from_post_meridiem_time(initial_time + interval_offset.hour),
        )
      rescue
        puts "Duplicate service"
      end
      initial_time += interval_offset.hour
    end
  end

  def populate_availabilities
    starting_date = duration.starting_date
    start_time = from_post_meridiem_time duration.from_time
    end_time = from_post_meridiem_time duration.to_time

    intervals = end_time.to_i - start_time.to_i <= 0 ?
      24 + end_time.to_i - start_time.to_i :
      end_time.to_i - start_time.to_i

    intervals /= interval_offset
    create_availabilities(start_time, starting_date, intervals)

    from = starting_date.wday
    to = duration.repetition_days

    for i in 1..duration.repetition
      to.each do |t|
        t = t.to_i
        next_date = t % 7 - from < 0 ?
          starting_date + ((i - 1) * 7) + (t % 7 - from + 7) :
          t % 7 - from == 0 ?
          starting_date + ((i - 1) * 7) + (7) :
          starting_date + ((i - 1) * 7) + (t % 7 - from)

        create_availabilities(start_time, next_date, intervals)
      end
    end
  end
end
