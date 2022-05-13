# Plapp

Experiment using Plug (fork https://github.com/jmrepetti/plug) as composable business applicatin logic. 


## Usage

```elixir
defmodule Shop.Blops.Purchase do
  use Plug.Builder, conn_module: Plapp.Ctx

  plug :process_order_bla
  plug :it_can_go_wrong
  plug :none

  def process_order_bla(ctx, _opts) do
    Plapp.Ctx.assign(ctx, :data, "xxxxxxx")
  end

  def it_can_go_wrong(ctx, _opts) do
    app_error = %{code: 2021, error: "Something is wrong with whatever you did"}
    Plapp.Ctx.fail(ctx, app_error)
  end

  def none(ctx, _opts) do
    ctx
  end
end
```


## Installation

```elixir
def deps do
  [
    {:plapp, github_repo_url}
  ]
end
```