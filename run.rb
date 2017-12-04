require_relative './assigner'

data = [
  { name: 'Replace me', email: 'replace@me.com' },
  { name: 'Replace me2', email: 'replace@me.com' }
]

list = GifteeList.new(data)
list.shuffle
list.assign_giftees!

assigner = Assigner.new(list.santas)
assigner.send!
