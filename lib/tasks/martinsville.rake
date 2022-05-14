namespace :martinsville do
  task :build_course => :environment do
    martinsville_cc = Course.find_or_create_by(name: "Martinsville Country Club")
    Event.find_or_create_by(name: "Martinsville CC - Beta Round", startDate: "5/14/2022", tee_time_window: ["Morning", "Afternoon", "Evening"], course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 1, yardage: 362, nickname: "Hole 1", par: 4, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 2, yardage: 161, nickname: "Hole 2", par: 3, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 3, yardage: 317, nickname: "Hole 3", par: 4, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 4, yardage: 368, nickname: "Hole 4", par: 4, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 5, yardage: 190, nickname: "Hole 5", par: 3, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 6, yardage: 379, nickname: "Hole 6", par: 4, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 7, yardage: 353, nickname: "Hole 7", par: 4, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 8, yardage: 365, nickname: "Hole 8", par: 4, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 9, yardage: 503, nickname: "Hole 9", par: 5, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 10, yardage: 325, nickname: "Hole 10", par: 4, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 11, yardage: 501, nickname: "Hole 11", par: 5, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 12, yardage: 391, nickname: "Hole 12", par: 4, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 13, yardage: 146, nickname: "Hole 13", par: 3, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 14, yardage: 378, nickname: "Hole 14", par: 4, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 15, yardage: 403, nickname: "Hole 15", par: 4, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 16, yardage: 485, nickname: "Hole 16", par: 5, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 17, yardage: 176, nickname: "Hole 17", par: 3, course_id: martinsville_cc.id)
    Hole.find_or_create_by(number: 18, yardage: 399, nickname: "Hole 18", par: 4, course_id: martinsville_cc.id)
  end

  task :add_players => :environment do
    martinsville_cc = Course.find_by(name: "Martinsville Country Club")
    event = Event.find_by(name: "Martinsville CC - Beta Round")
    brock = Player.find_or_create_by(name: "Brock Sellers", phone_number: "317-777-0439")
    tyler = Player.find_or_create_by(name: "Tyler Waite", phone_number: "317-205-6516")

    brock_event = PlayerEvent.find_or_create_by(player_id: brock.id, event_id: event.id, tee_time_windows: ["Morning", "Afternoon"])
    tyler_event = PlayerEvent.find_or_create_by(player_id: tyler.id, event_id: event.id, tee_time_windows: ["Afternoon", "Evening"])

    holes = martinsville_cc.holes
    holes.each do |hole|
      PlayerEventHole.find_or_create_by(event_id: event.id, hole_id: hole.id, player_id: brock.id, player_event_id: brock_event.id)
      PlayerEventHole.find_or_create_by(event_id: event.id, hole_id: hole.id, player_id: tyler.id, player_event_id: tyler_event.id)
    end

    puts "#{brock_event.generate_scorecard_link}"
    puts "#{tyler_event.generate_scorecard_link}"
  end
end