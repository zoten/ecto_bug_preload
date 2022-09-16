defmodule EctoBug.Schema.Post do
  use Ecto.Schema

  schema "posts" do
    field(:title, :string)
    field(:content, :string)

    timestamps()

    belongs_to(:author, EctoBug.Schema.Author)
  end
end
