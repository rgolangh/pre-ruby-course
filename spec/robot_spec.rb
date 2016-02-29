require "./robot.rb"

describe Robot do
  it "ignores non PLACE commands if not performed" do
    r = Robot.new
    expect(r.command(Robot::MOVE)).to eq(Robot::ILLEGAL)
  end

  it "place action is allowed as first command" do
    r = Robot.new
    expect(r.command(Robot::PLACE, x=1, y=2)).to eq(Robot::DONE)
  end

  it "places robot in using args " do
    r = Robot.new
    r.command(Robot::PLACE, x=1, y=2)
    x = r.command(Robot::REPORT)[0]
    expect(x).to eq(1)
  end

  it "moves to an illegal place" do
    r = Robot.new
    r.command(Robot::PLACE, x=25, y=25)
    expect(r.command(Robot::MOVE)).to eq(Robot::ILLEGAL_MOVE)
    expect(r.command(Robot::REPORT)).to eq([25, 25, Robot::N])
  end

  it "move left" do
    r = Robot.new
    r.command(Robot::PLACE, x=25, y=25)
    r.command(Robot::LEFT)
    r.command(Robot::MOVE)
    pos = r.command(Robot::REPORT)
    expect(pos[0]).to eq(24)
    expect(pos[2]).to eq(Robot::W)
  end

  it "move right" do
    r = Robot.new
    r.command(Robot::PLACE, x=3, y=25)
    r.command(Robot::RIGHT)
    r.command(Robot::MOVE)
    pos = r.command(Robot::REPORT)
    expect(pos[0]).to eq(4)
    expect(pos[2]).to eq(Robot::E)
  end

  it "move south" do
    r = Robot.new
    r.command(Robot::PLACE, x=3, y=25)
    r.command(Robot::RIGHT)
    r.command(Robot::RIGHT)
    r.command(Robot::MOVE)
    pos = r.command(Robot::REPORT)
    expect(pos[0]).to eq(3)
    expect(pos[1]).to eq(24)
    expect(pos[2]).to eq(Robot::S)
  end

  it "move south" do
    r = Robot.new
    r.command(Robot::PLACE, x=3, y=25)
    r.command(Robot::RIGHT)
    r.command(Robot::RIGHT)
    r.command(Robot::RIGHT)
    r.command(Robot::MOVE)
    pos = r.command(Robot::REPORT)
    expect(pos[0]).to eq(2)
    expect(pos[1]).to eq(25)
    expect(pos[2]).to eq(Robot::W)
  end

end
