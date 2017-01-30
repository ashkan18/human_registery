defmodule HumanRegistry.HumansController do
  use HumanRegistry.Web, :controller
  import Ecto.Query
  alias HumanRegistry.{Repo, Humans}

  def index(conn, _params) do
    humans = Repo.all(Humans)
    render(conn, "index.html", humans: humans)
  end

  def new(conn, _params) do
    changeset = Humans.changeset(%Humans{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"humans" => humans_params}) do
    %{"name" => name, "email" => email} = humans_params
    last_humans = Repo.one(from x in Humans, order_by: [desc: x.id], limit: 1)
    changeset = Humans.changeset(last_humans, %{names: last_humans.names ++ [Cipher.encrypt(name)], emails: last_humans.emails ++ [Cipher.encrypt(email)]})
    case Repo.update(changeset) do
      {:ok, _humans} ->
        conn
        |> put_flash(:info, "Thanks for registing as a human.")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        # most likely we ran out of column limit
        # create a new human row
        Repo.insert(%Humans{names: [Cipher.encrypt(name)], emails: [Cipher.encrypt(email)]})
        render(conn, "new.html", changeset: changeset)
    end
  end
end
