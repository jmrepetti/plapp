defmodule PlappTest do
  use ExUnit.Case
  doctest Plapp

  test "greets the world" do
    assert Plapp.hello() == :world
  end
end
