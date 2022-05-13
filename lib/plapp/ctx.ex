defmodule Plapp.Ctx do

  @type assigns :: %{optional(atom) => any}
  @type halted :: boolean
  @type int_status :: non_neg_integer | nil
  @type result :: term
  @type status :: atom | int_status


  @type t :: %__MODULE__{
    assigns: assigns,
    halted: halted,
    result: result | nil,
    status: int_status
  }

  defstruct assigns: %{},
            halted: false,
            result: nil,
            status: nil

  alias Plapp.Ctx

  def assign(%Ctx{assigns: assigns} = ctx, key, value) when is_atom(key) do
    %{ctx | assigns: Map.put(assigns, key, value)}
  end

  @spec halt(t) :: t
  def halt(%Ctx{} = ctx) do
    %{ctx | halted: true}
  end

  @spec fail(t, any) :: t
  def fail(%Ctx{} = ctx, error) do
    %{ctx | halted: true, status: error}
  end

  defmodule SomeError do
    defexception message: "an error occured"

    @moduledoc """
    Error raised when something happend
    """
  end
end

defimpl String.Chars, for: Plapp.Ctx do
  def to_string(data) do
    inspect(data)
  end
end


defimpl Phoenix.HTML.Safe, for: Plapp.Ctx do
  def to_iodata(data), do: "#{String.Chars.to_string(data)}"
end
