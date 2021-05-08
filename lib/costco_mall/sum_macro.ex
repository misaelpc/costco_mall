defmodule CostcoMall.SumMacro do
  defmacro nice_print({:+, _meta, [lhs, rhs]}) do
    quote do
      IO.puts """
        #{unquote(lhs)}
      + #{unquote(rhs)}
        --
        #{unquote(lhs+rhs)}
      """
    end
  end
end
