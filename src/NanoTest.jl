module NanoTest

import Graphs: graph, KeyVertex, Edge
import Graphs: make_vertex, add_vertex!, add_edge!

export describe,
       before,
       after,
       it,
       @expect

type ContextHandler
  ctx_graph
  current_ctx_vertex

  function ContextHandler()
    # Create graph with root context
    ctx_graph = graph(KeyVertex{Dict}[], Edge{KeyVertex{Dict}}[])
    ctx = {
      :type => :root
    }
    ctx_vertex = make_vertex(ctx_graph, ctx)
    add_vertex!(ctx_graph, ctx_vertex)

    # Initialize
    new(ctx_graph, ctx_vertex)
  end
end

function add_ctx!(ctx_handler::ContextHandler, ctx)
  # Add new context vertex to graph
  ctx_graph = ctx_handler.ctx_graph
  new_ctx_vertex = make_vertex(ctx_graph, ctx)
  add_vertex!(ctx_graph, new_ctx_vertex)

  # Add edge from current context vertex to new context vertex
  current_ctx_vertex = ctx_handler.current_ctx_vertex
  add_edge!(ctx_graph, current_ctx_vertex, new_ctx_vertex)

  # Update current context vertex to new context vertex
  ctx_handler.current_ctx_vertex = new_ctx_vertex
end

default_ctx_handler = ContextHandler()

function before(func::Function; ctx_handler=default_ctx_handler)
  ctx = {
    :func => func,
    :type => :before
  }
  add_ctx!(ctx_handler, ctx)
end
function after(func::Function; ctx_handler=default_ctx_handler)
  ctx = {
    :func => func,
    :type => :after
  }
  add_ctx!(ctx_handler, ctx)
end
function describe(func::Function, desc::String; ctx_handler=default_ctx_handler)
  ctx = {
    :func => func,
    :desc => desc,
    :type => :describe
  }
  add_ctx!(ctx_handler, ctx)
end
function it(func::Function, desc::String; ctx_handler=default_ctx_handler)
  ctx = {
    :func => func,
    :desc => desc,
    :type => :it
  }
  add_ctx!(ctx_handler, ctx)
end

macro expect(ex)
end

end # module
