namespace :riverside do
  task :build_course => :environment do
    riverside = Course.find_or_create_by(name: "Riverside Par 3", gps_enabled: true)
    Event.find_or_create_by(name: "The Annual Open", startDate: "5/27/2022", tee_time_window: ["Morning", "Afternoon", "Evening"], course_id: riverside.id)
    Hole.find_or_create_by(number: 1, yardage: 90, nickname: "Razortooth", par: 3, course_id: riverside.id, green_long: "-86.195530", green_lat: "39.821796")
    Hole.find_or_create_by(number: 2, yardage: 102, nickname: "Roof Keg", par: 3, course_id: riverside.id, green_long: "-86.195532", green_lat: "39.823062")
    Hole.find_or_create_by(number: 3, yardage: 135, nickname: "Blowie", par: 3, course_id: riverside.id, green_long: "-86.196404", green_lat: "39.823362")
    Hole.find_or_create_by(number: 4, yardage: 104, nickname: "The Breakup", par: 3, course_id: riverside.id, green_long: "-86.196782", green_lat: "39.822329")
    Hole.find_or_create_by(number: 5, yardage: 114, nickname: "ESAK", par: 3, course_id: riverside.id, green_long: "-86.198297", green_lat: "39.823019")
    Hole.find_or_create_by(number: 6, yardage: 148, nickname: "Dog Water", par: 3, course_id: riverside.id, green_long: "-86.196513", green_lat: "39.823960")
    Hole.find_or_create_by(number: 7, yardage: 122, nickname: "Whole Milk", par: 3, course_id: riverside.id, green_long: "-86.194952", green_lat: "39.823814")
    Hole.find_or_create_by(number: 8, yardage: 126, nickname: "Haverford", par: 3, course_id: riverside.id, green_long: "-86.194340", green_lat: "39.823165")
    Hole.find_or_create_by(number: 9, yardage: 144, nickname: "Mile 497.5", par: 3, course_id: riverside.id, green_long: "-86.194976", green_lat: "39.821886")
  end

  task :add_players => :environment do
    riverside = Course.find_by(name: "Riverside Par 3")
    event = Event.find_by(name: "The Annual Open")
    ben = Player.find_or_create_by(name: "Ben Call", phone_number: "317-777-0439")
    eileen = Player.find_or_create_by(name: "Eileen Call", phone_number: "317-205-6516")

    PlayerEvent.find_or_create_by(player_id: ben.id, event_id: event.id, tee_time_windows: ["Morning", "Afternoon"])
    PlayerEvent.find_or_create_by(player_id: eileen.id, event_id: event.id, tee_time_windows: ["Afternoon", "Evening"])

    holes = riverside.holes
    holes.each do |hole|
      PlayerEventHole.find_or_create_by(event_id: event.id, hole_id: hole.id, player_id: ben.id)
      PlayerEventHole.find_or_create_by(event_id: event.id, hole_id: hole.id, player_id: eileen.id)
    end
  end
end