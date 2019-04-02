require('pry-byebug')
require_relative('models/bounty')

bounty1 = Bounty.new({ 'name' => 'BountyHunter',
                        'species' => 'Alien',
                        'bounty_value' => 50,
                       'fave_weapon' => 'alientech' })
bounty1.save()

bounty2 = Bounty.new({ 'name' => 'SpaceCowboy',
                       'species' => 'Human',
                       'bounty_value' => 100,
                      'fave_weapon' => 'gun' })

bounty2.save()

bounty3 = Bounty.new({ 'name' => 'Original BountyHunter',
                       'species' => 'Alien',
                       'bounty_value' => 1000,
                      'fave_weapon' => 'gun' })
bounty3.save()

Bounty.find_by_name('BountyHunter')
bounties = Bounty.all()

bounty2.bounty_value = 20

bounty2.update()
bounty2.save()
bounty3.delete()
