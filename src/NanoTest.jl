module NanoTest

export describe,
       before,
       after,
       it,
       @expect

function before(func::Function)
end
function after(func::Function)
end
function describe(func::Function, desc::String)
end
function it(func::Function, desc::String)
end

macro expect(ex)
end

end # module
