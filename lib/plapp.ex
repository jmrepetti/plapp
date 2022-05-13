defmodule Plapp do

  @type opts ::
  binary
  | tuple
  | atom
  | integer
  | float
  | [opts]
  | %{optional(opts) => opts}
  | MapSet.t()

  @callback init(opts) :: opts
  @callback call(conn :: Plapp.Ctx.t(), opts) :: Plapp.Ctx.t()

end
