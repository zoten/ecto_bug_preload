defmodule EctoBug.Repo.Migrations.InitialMigration do
  use Ecto.Migration

  def change do
    create table("authors") do
      add :name,    :string

      timestamps()
    end

    create index("authors", [:name], unique: true)

    create table("posts") do
      add :title,    :string
      add :content,    :string

      add :author_id, references("authors")

      timestamps()
    end
  end
end
