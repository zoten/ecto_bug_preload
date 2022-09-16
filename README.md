# EctoBug

Small poc of little ecto bug found

``` shell
mix deps.get && mix compile
mix ecto.create
mix ecto.migrate

iex -S mix run -e "EctoBug.hello"
```

Expected result: update on conflict successful since `posts` is not in the changeset
Actual result

``` shell
** (RuntimeError) attempting to cast or change association `posts` from `EctoBug.Schema.Author` that was not loaded. Please preload your associations before manipulating them through changesets
```
