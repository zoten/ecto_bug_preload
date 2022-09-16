defmodule EctoBug.Schema.Author do
  use Ecto.Schema

  alias __MODULE__
  import Ecto.Changeset
  import Ecto.Query

  schema "authors" do
    field(:name, :string)

    timestamps()

    has_many(:posts, EctoBug.Schema.Post,
      on_replace: :delete,
      defaults: [title: "default"]
    )
  end

  def changeset(schema \\ %Author{}, params) do
    schema
    |> cast(params, ~w(name)a)
    |> validate_required(:name)
  end

  def by_name(name) do
    from(a in Author, where: a.name == ^name)
  end
end
