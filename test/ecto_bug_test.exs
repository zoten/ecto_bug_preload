defmodule EctoBugTest do
  use ExUnit.Case
  doctest EctoBug

  test "greets the world" do
    assert EctoBug.hello() == :world
  end
end
