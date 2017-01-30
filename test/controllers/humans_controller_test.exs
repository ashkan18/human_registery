defmodule HumanRegistry.HumansControllerTest do
  use HumanRegistry.ConnCase

  alias HumanRegistry.Humans
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, humans_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing humans"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, humans_path(conn, :new)
    assert html_response(conn, 200) =~ "New humans"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, humans_path(conn, :create), humans: @valid_attrs
    assert redirected_to(conn) == humans_path(conn, :index)
    assert Repo.get_by(Humans, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, humans_path(conn, :create), humans: @invalid_attrs
    assert html_response(conn, 200) =~ "New humans"
  end

  test "shows chosen resource", %{conn: conn} do
    humans = Repo.insert! %Humans{}
    conn = get conn, humans_path(conn, :show, humans)
    assert html_response(conn, 200) =~ "Show humans"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, humans_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    humans = Repo.insert! %Humans{}
    conn = get conn, humans_path(conn, :edit, humans)
    assert html_response(conn, 200) =~ "Edit humans"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    humans = Repo.insert! %Humans{}
    conn = put conn, humans_path(conn, :update, humans), humans: @valid_attrs
    assert redirected_to(conn) == humans_path(conn, :show, humans)
    assert Repo.get_by(Humans, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    humans = Repo.insert! %Humans{}
    conn = put conn, humans_path(conn, :update, humans), humans: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit humans"
  end

  test "deletes chosen resource", %{conn: conn} do
    humans = Repo.insert! %Humans{}
    conn = delete conn, humans_path(conn, :delete, humans)
    assert redirected_to(conn) == humans_path(conn, :index)
    refute Repo.get(Humans, humans.id)
  end
end
