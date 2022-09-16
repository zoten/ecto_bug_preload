defmodule EctoBug do
  @moduledoc """
  Documentation for `EctoBug`.
  """

  alias EctoBug.Repo
  alias EctoBug.Schema.Author
  alias EctoBug.Schema.Post

  def replicate(variation \\ :one) do
    Repo.start_link()

    Repo.delete_all(Author)
    Repo.delete_all(Post)

    {:ok, item} =
      %{name: "authorz"}
      |> Author.changeset()
      |> Repo.insert()

    do_replicate(variation, item)
  end

  def do_replicate(:one, _item) do
    "authorz"
    |> Author.by_name()
    |> Repo.one()
    |> Author.changeset(%{name: "authorx"})
    # result does not change using :replace_all, {:replace_all_except, [:id, :posts]} or {:replace_all_except, [:id]}
    |> Repo.insert(on_conflict: {:replace_all_except, [:id]})

    # crash
  end

  def do_replicate(:two, _item) do
    %{name: "authorz"}
    |> Author.changeset()
    |> Repo.insert(on_conflict: {:replace_all_except, [:id]})

    # this works well

    Author |> Repo.all() |> IO.inspect()
  end

  def do_replicate(:three, _item) do
    "authorz"
    |> Author.by_name()
    |> Repo.one()
    |> Author.changeset(%{name: "authorz"})
    # result does not change using :replace_all, {:replace_all_except, [:id, :posts]} or {:replace_all_except, [:id]}
    |> Repo.insert(on_conflict: {:replace_all_except, [:id]})

    # crash
  end

  def do_replicate(:four, item) do
    %Author{id: item.id}
    |> Author.changeset(%{name: "authorx"})
    # result does not change using :replace_all, {:replace_all_except, [:id, :posts]} or {:replace_all_except, [:id]}
    |> Repo.insert(on_conflict: {:replace_all_except, [:id]})

    # this works well

    Author |> Repo.all() |> IO.inspect()
  end
end
