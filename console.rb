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
cowboy2.save()

# result_true = SpaceCowboys.find_by_name("Boba Fett")
result_false = SpaceCowboys.find_by_name("Marco")

result_true_id = SpaceCowboys.find_by_id("1")
result_true_id2 = SpaceCowboys.find_by_id("4")
result_false_id = SpaceCowboys.find_by_id("100")

# cowboy2.delete()
# SpaceCowboys.find_by_name("marco")
binding.pry
nil
