defmodule CableTestTest do
  use ExUnit.Case
  doctest CableTest

  test "greets the world" do
    assert CableTest.hello() == :world
  end
end
