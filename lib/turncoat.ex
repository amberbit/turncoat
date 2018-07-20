defmodule Turncoat do
  def h(nodeName, attributes \\ %{})
  def h(nodeName, nil), do: h(nodeName, %{})

  def h(nodeName, attributes) when is_list(attributes) do
    h(nodeName, Mappable.to_map(attributes, keys: :strings))
  end

  def h(nodeName, attributes) do
    children = attributes["children"] || []
    attributes = Map.delete(attributes, "children")

    %Turncoat.Node{
      nodeName: nodeName,
      attributes: attributes,
      children: children,
      key: attributes["key"]
    }
  end
end
