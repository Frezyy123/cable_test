{:ok, cable} = Cables.new("http://http2.github.io", :http)

pool_options = [{:pool_size, 1}, {:backlog_size, 4096}, {:pool_size, 2048}]
url = :buoy_utils.parse_url(<<"http://http2.github.io/">>)
:buoy_pool.start(url, pool_options)

requests = 1000
epochs = 1

Benchee.run(%{
  "cables" => fn ->
    Enum.each(1..epochs, fn _e ->
      Enum.map(1..requests, fn _r -> Task.async(fn -> Cables.get(cable, "/") end) end)
      |> Enum.each(fn task -> Task.await(task) end)

      Process.sleep(500)
    end)
  end
  # "buoy" => fn ->
  #   Enum.each(1..epochs, fn _e ->
  #     Enum.map(1..requests, fn _r ->
  #       Task.async(fn -> :buoy.get(url, %{timeout: 5000}) end)
  #     end)
  #     |> Enum.each(fn task -> Task.await(task) end)

  #     Process.sleep(500)
  #   end)
  # end
})
