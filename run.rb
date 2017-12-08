require_relative './secret_santa'

DRY_RUN = ENV['DRY_RUN']
SAVE_OUTPUT = ENV['SAVE_OUTPUT']

data = [
  { name: 'Denise', email: 'denise@example.com' },
  { name: 'Jen', email: 'jen@example.com' },
  { name: 'Sean', email: 'sean@example.com' },
  { name: 'Spike', email: 'spike@example.com' }
]

list = GifteeListAssigner.new(data)
list.shuffle
list.assign_giftees!

if SAVE_OUTPUT
  f = File.new('./santas', 'w')
  list.santas.each {|line| f.write("#{line}\n") }
  f.close
end

if DRY_RUN
  puts "Dry run, no emails will be sent. Every run is randomised, so this may not reflect the final assignments."
  list.santas.each {|s| puts s}
  exit
end

assigner = Mailer.new(list.santas)
assigner.send!
