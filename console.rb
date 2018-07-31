require("pry")
require_relative("models/space_cowboys.rb")

cowboy1 = SpaceCowboys.new(
  {
    'name' => "Boba Fett",
    'bounty_value' => "100",
    'danger_level' => "high",
    'cashed_in' => "true"
  }
)

cowboy2 = SpaceCowboys.new(
  {
    'name' => "Django",
    'bounty_value' => "50",
    'danger_level' => "medium",
    'cashed_in' => "false"
  }
)

cowboy1.save()

binding.pry
nil 
