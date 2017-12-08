require 'mail'

class Mailer
  def initialize(assignments, host_email = 'noreply@example.com')
    @assignments = assignments
    @host_email = host_email
  end

  def send!
    @assignments.each do |assignment|
      mail_to(assignment)
    end
  end

  def mail_to(assignee)
    mail = Mail.new do
      from  @host_email
      to    assignee[:email]
      subject	'🎄 🎄 🎄  Your Secret Santa gift recipient is... 🎅 🎅 🎅'
      body	"You will be buying a gift for...........\n\n\n#{assignee[:giftee]}!!!!!!"
    end

    mail.deliver!
  end
end

class GifteeListAssigner
  attr_reader :santas

  def initialize(santas)
    @santas = santas
  end

  def shuffle
    @santas = @santas.shuffle
  end

  def assign_giftees!
    @giftees = @santas.cycle(2).to_a
    @santas.each do |santa|
      next_index = @giftees.find_index { |s| s[:name] == santa[:name] }.next
      santa[:giftee] = @giftees[next_index][:name]
    end
  end

  def giftee_of(santa)
    @giftees.find { |s| s[:name] == santa }[:giftee]
  end
end
