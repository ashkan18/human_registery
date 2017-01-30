defmodule HumanRegistry.HumansTest do
  use HumanRegistry.ModelCase

  alias HumanRegistry.Humans

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Humans.changeset(%Humans{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Humans.changeset(%Humans{}, @invalid_attrs)
    refute changeset.valid?
  end
end
