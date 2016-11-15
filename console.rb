require('pry-byebug')
require_relative('space_cowboys')

SpaceCowboy.delete_all

bounty1 = SpaceCowboy.new({
  'name' => 'Chu Pika',
  'species' => 'Varchar',
  'bounty' => 255,
  'last_known_location' => 'Pallet Planet'
  })
bounty2 = SpaceCowboy.new({
  'name' => 'Spock',
  'species' => 'Vulcan',
  'bounty' => 179276,
  'last_known_location' => 'Enterprise reactor room'
  })
bounty3 = SpaceCowboy.new({
  'name' => 'Jar Jar',
  'species' => 'Gungan',
  'bounty' => 2147483647,
  'last_known_location' => 'Under an AAT-1 Hover Tank'
  })

bounty1.save()
bounty2.save()
bounty3.save()

binding.pry
nil