require 'mail'
require_relative './assigner'

describe 'GifteeList' do
  it 'assigns everyone a giftee without sub-loops' do
    list = GifteeList.new([
                            { name: 'Sandrine', email: 'sandrine@example.com' },
                            { name: 'Ella', email: 'ella@example.com' },
                            { name: 'Nicole', email: 'nicole@example.com' },
                            { name: 'Sean', email: 'sean@example.com' }
                          ])

    allow(list)
      .to receive(:shuffle)
      .and_return([
                    { name: 'Sean', email: 'sean@example.com' },
                    { name: 'Sandrine', email: 'sandrine@example.com' },
                    { name: 'Ella', email: 'ella@example.com' },
                    { name: 'Nicole', email: 'nicole@example.com' }
                  ])

    list.assign_giftees!
    expect(list.giftee_of('Sandrine')).to eq 'Ella'
    expect(list.giftee_of('Ella')).to eq 'Nicole'
    expect(list.giftee_of('Nicole')).to eq 'Sean'
    expect(list.giftee_of('Sean')).to eq 'Sandrine'
  end
end

describe 'Assigner' do
  it 'sends an email to each santa about their giftee' do
    assignments = [
      { name: 'Denise', email: 'denise@example.com', giftee: 'Spike' },
      { name: 'Spike', email: 'spike@example.com', giftee: 'Denise' }
    ]

    assigner = Assigner.new(assignments, 'secretsantahost@example.com')
    allow(assigner).to receive(:mail_to)

    expect(assigner).to receive(:mail_to).twice
    assigner.send!
  end
end
