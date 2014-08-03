using NanoTest
using Base.Test

# Example spec runs without error (derived from Ruby MiniTest)
type Meme end
i_can_haz_cheezburger(_::Meme) = "OHAI!"
will_it_blend(_::Meme) = "YES!"

describe("Meme") do
  local meme::Meme

  before() do
    meme = Meme()
  end
  after() do
    nothing
  end

  describe("when asked about cheeseburgers") do
    it("must respond positively") do
      @expect i_can_haz_cheezburger(meme) == "OHAI!"
    end
  end

  describe("when asked about blending possibilites") do
    it("won't say no") do
      @expect will_it_blend(meme) != "NO!"
    end
  end
end
