defmodule EctoBug do
  @moduledoc """
  Documentation for `EctoBug`.
  """

  alias EctoBug.Repo
  alias EctoBug.Schema.Author
  alias EctoBug.Schema.Post

  def hello do
    Repo.start_link()

    Repo.delete_all(Author)
    Repo.delete_all(Post)

    {:ok, _} =
      %{name: "authorz"}
      |> Author.changeset()
      |> Repo.insert()

    "authorz"
    |> Author.by_name()
    |> Repo.one()
    |> Author.changeset(%{name: "authorx"})
    # result does not change using :replace_all
    |> Repo.insert(on_conflict: {:replace_all_except, [:posts]})
  end
end
