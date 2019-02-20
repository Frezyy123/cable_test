defmodule CableTest do
  @moduledoc """
  Documentation for CableTest.
  """
  require Logger

  @doc """
  Hello world.

  ## Examples

      iex> CableTest.hello()
      :world

  """
  def get(name, path, headers, _connection_timeout) do
    # body =
    #   %{
    #     country: "XX",
    #     deleted: false,
    #     inserted_at: ~N[2019-01-17 16:31:45.624125],
    #     ip: "94.25.229.18",
    #     language: "ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3",
    #     ref: "",
    #     subscribe_datetime: DateTime.utc_now(),
    #     subscription_id: 1,
    #     sw_version: 3,
    #     token: "123",
    #     unsubscribe_datetime: nil,
    #     updated_at: ~N[2019-01-17 16:31:45.624130],
    #     usage_type: "?",
    #     user_agent: "Mozilla/5.0 (Android 7.1.2; Mobile; rv:64.0) Gecko/64.0 Firefox/64.0"
    #   }
    #   |> Jason.encode!()

    # Cables.post(name, path, headers, body, connection_timeout: 2_000)
    Cables.get()
  end

  def hundred_get(name, path, headers, _connection_timeout) do
    body =
      "{\"date\":\"2019-02-11\",\"dist_id\":\"1\",\"event\":\"received\",\"feed_id\":0,\"hour\":\"2019-02-11 15:00:00\",\"sub\":\"{\\\"subscription_id\\\":1,\\\"country\\\":\\\"XX\\\",\\\"ref\\\":\\\"\\\",\\\"usage_type\\\":\\\"?\\\",\\\"unsubscribe_datetime\\\":null,\\\"ip\\\":\\\"127.0.0.1\\\",\\\"language\\\":\\\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7,ca;q=0.6,et;q=0.5\\\",\\\"id\\\":5800,\\\"user_agent\\\":\\\"Mozilla\\\\/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit\\\\/537.36 (KHTML, like Gecko) Chrome\\\\/72.0.3626.81 Safari\\\\/537.36\\\",\\\"sw_version\\\":3,\\\"token\\\":\\\"e21Bh5ESTPA:APA91bFl6shQWw5SCjjVrcebjxDdBVceI8UKyrrdcU_AmO0iT0pZoMFl0e-nKe-Ge5HzuMi5Bvd_7niWZnd5xwwTD5oI1MdNPmIsPQmDb93B7a3UMUv04wwrSCr7NnZN1-e2TV1qj0PY\\\"}\"}"

    Enum.map(1..100, fn _d ->
      Task.async(fn -> Cables.post(name, path, headers, body, connection_timeout: 5_000) end)
    end)
    |> Enum.map(fn x ->
      data =
        case Task.await(x) do
          {:ok, data} -> data
          {:error, reason} -> Logger.error("#{inspect(reason)}")
        end

      # Logger.info("#{inspect(data)}")
    end)
  end

  def thousand_get(name, path, headers, _connection_timeout) do
    body =
      "{\"date\":\"2019-02-11\",\"dist_id\":\"1\",\"event\":\"received\",\"feed_id\":0,\"hour\":\"2019-02-11 15:00:00\",\"sub\":\"{\\\"subscription_id\\\":1,\\\"country\\\":\\\"XX\\\",\\\"ref\\\":\\\"\\\",\\\"usage_type\\\":\\\"?\\\",\\\"unsubscribe_datetime\\\":null,\\\"ip\\\":\\\"127.0.0.1\\\",\\\"language\\\":\\\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7,ca;q=0.6,et;q=0.5\\\",\\\"id\\\":5800,\\\"user_agent\\\":\\\"Mozilla\\\\/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit\\\\/537.36 (KHTML, like Gecko) Chrome\\\\/72.0.3626.81 Safari\\\\/537.36\\\",\\\"sw_version\\\":3,\\\"token\\\":\\\"e21Bh5ESTPA:APA91bFl6shQWw5SCjjVrcebjxDdBVceI8UKyrrdcU_AmO0iT0pZoMFl0e-nKe-Ge5HzuMi5Bvd_7niWZnd5xwwTD5oI1MdNPmIsPQmDb93B7a3UMUv04wwrSCr7NnZN1-e2TV1qj0PY\\\"}\"}"

    Enum.map(1..1000, fn _d ->
      Task.async(fn -> Cables.post(name, path, headers, body, connection_timeout: 5_000) end)
    end)
    |> Enum.map(fn x ->
      data =
        case Task.await(x) do
          {:ok, data} -> data
          {:error, reason} -> Logger.error("#{inspect(reason)}")
        end

      # Logger.info("#{inspect(data)}")
    end)
  end

  def ten_thousand_get(name, path, headers, _connection_timeout) do
    body =
      "{\"date\":\"2019-02-11\",\"dist_id\":\"1\",\"event\":\"received\",\"feed_id\":0,\"hour\":\"2019-02-11 15:00:00\",\"sub\":\"{\\\"subscription_id\\\":1,\\\"country\\\":\\\"XX\\\",\\\"ref\\\":\\\"\\\",\\\"usage_type\\\":\\\"?\\\",\\\"unsubscribe_datetime\\\":null,\\\"ip\\\":\\\"127.0.0.1\\\",\\\"language\\\":\\\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7,ca;q=0.6,et;q=0.5\\\",\\\"id\\\":5800,\\\"user_agent\\\":\\\"Mozilla\\\\/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit\\\\/537.36 (KHTML, like Gecko) Chrome\\\\/72.0.3626.81 Safari\\\\/537.36\\\",\\\"sw_version\\\":3,\\\"token\\\":\\\"e21Bh5ESTPA:APA91bFl6shQWw5SCjjVrcebjxDdBVceI8UKyrrdcU_AmO0iT0pZoMFl0e-nKe-Ge5HzuMi5Bvd_7niWZnd5xwwTD5oI1MdNPmIsPQmDb93B7a3UMUv04wwrSCr7NnZN1-e2TV1qj0PY\\\"}\"}"

    Enum.map(1..10000, fn _d ->
      Task.async(fn -> Cables.post(name, path, headers, body, connection_timeout: 5_000) end)
    end)
    |> Enum.map(fn x ->
      data =
        case Task.await(x) do
          {:ok, data} -> data
          {:error, reason} -> Logger.error("#{inspect(reason)}")
        end

      # Logger.info("#{inspect(data)}")
    end)
  end

  def hundred_thousand_get(name, path, headers, _connection_timeout) do
    body =
      "{\"date\":\"2019-02-11\",\"dist_id\":\"1\",\"event\":\"received\",\"feed_id\":0,\"hour\":\"2019-02-11 15:00:00\",\"sub\":\"{\\\"subscription_id\\\":1,\\\"country\\\":\\\"XX\\\",\\\"ref\\\":\\\"\\\",\\\"usage_type\\\":\\\"?\\\",\\\"unsubscribe_datetime\\\":null,\\\"ip\\\":\\\"127.0.0.1\\\",\\\"language\\\":\\\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7,ca;q=0.6,et;q=0.5\\\",\\\"id\\\":5800,\\\"user_agent\\\":\\\"Mozilla\\\\/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit\\\\/537.36 (KHTML, like Gecko) Chrome\\\\/72.0.3626.81 Safari\\\\/537.36\\\",\\\"sw_version\\\":3,\\\"token\\\":\\\"e21Bh5ESTPA:APA91bFl6shQWw5SCjjVrcebjxDdBVceI8UKyrrdcU_AmO0iT0pZoMFl0e-nKe-Ge5HzuMi5Bvd_7niWZnd5xwwTD5oI1MdNPmIsPQmDb93B7a3UMUv04wwrSCr7NnZN1-e2TV1qj0PY\\\"}\"}"

    Enum.map(1..100000, fn _d ->
      Task.async(fn -> Cables.post(name, path, headers, body, connection_timeout: 5_000) end)
    end)
    |> Enum.map(fn x ->
      data =
        case Task.await(x) do
          {:ok, data} -> data
          {:error, reason} -> Logger.error("#{inspect(reason)}")
        end

      # Logger.info("#{inspect(data)}")
    end)
  end
end
