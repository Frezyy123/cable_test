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
    Cables.get(name, path, headers, connection_timeout: 2_000, pool_timeout: 5000)
  end

  def hundred_get(name, path, headers, _connection_timeout) do
    Enum.map(1..100, fn _d ->
      Task.async(fn -> Cables.get(name, path, headers, connection_timeout: 2_000) end)
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
    Enum.map(1..1000, fn _d ->
      Task.async(fn -> Cables.get(name, path, headers, connection_timeout: 2_000) end)
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
    Enum.map(1..10000, fn _d ->
      Task.async(fn ->
        Cables.get(name, path, headers, connection_timeout: 2_000, pool_timeout: 10_000)
      end)
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
    Enum.map(1..100_000, fn _d ->
      Task.async(fn -> Cables.get(name, path, headers, connection_timeout: 2_000) end)
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
