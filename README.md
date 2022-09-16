# EctoBug

Small poc of little ecto bug found

``` bash
mix deps.get && mix compile
mix ecto.create
mix ecto.migrate

iex -S mix run -e "EctoBug.replicate"
```

Expected result: update on conflict successful since `posts` is not in the changeset
Actual result

``` bash
** (RuntimeError) attempting to cast or change association `posts` from `EctoBug.Schema.Author` that was not loaded. Please preload your associations before manipulating them through changesets
```

## Other cases

Some of them work, some replicate the bug. Seems the fetching of the row is the discriminant

``` bash
iex -S mix run -e "EctoBug.replicate(:two)"
iex -S mix run -e "EctoBug.replicate(:three)"
iex -S mix run -e "EctoBug.replicate(:four)"
```
