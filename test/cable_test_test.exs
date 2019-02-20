defmodule CableTestTest do
  use ExUnit.Case


  setup do
    {module, params} = Cables.child_spec(CableTest, "http://http2.github.io/")
    {:ok, cable} = Cables.new("http://http2.github.io/", :http)

    pool_options =[{:pool_size, 1}]
    uri = :buoy_utils.parse_url(<<"http://http2.github.io/">>)
    :buoy_pool.start(uri)
    :ok
  end


end
