defmodule Turncoat.Node do
  @enforce_keys [:nodeName, :attributes, :children]
  defstruct nodeName: nil, attributes: %{}, children: [], key: nil
end
