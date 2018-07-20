defmodule TurncoatTest do
  use ExUnit.Case
  doctest Turncoat

  describe ".h/2" do
    test "creates simple nodes" do
      node = Turncoat.h("h1")

      assert node == %Turncoat.Node{nodeName: "h1", attributes: %{}, children: [], key: nil}
    end

    test "creates node with attributes" do
      node = Turncoat.h("h1", className: "main-header")

      assert node == %Turncoat.Node{
               nodeName: "h1",
               attributes: %{"className" => "main-header"},
               children: [],
               key: nil
             }
    end

    test "creates node with key" do
      node = Turncoat.h("h1", className: "main-header", key: "foo")

      assert node == %Turncoat.Node{
               nodeName: "h1",
               attributes: %{"className" => "main-header", "key" => "foo"},
               children: [],
               key: "foo"
             }
    end

    test "creates node with children" do
      node =
        Turncoat.h(
          "div",
          key: "wrapper",
          className: "container",
          children: [
            Turncoat.h("h1", children: ["Hi there!"])
          ]
        )

      assert node == %Turncoat.Node{
               nodeName: "div",
               attributes: %{"className" => "container", "key" => "wrapper"},
               key: "wrapper",
               children: [
                 %Turncoat.Node{
                   nodeName: "h1",
                   attributes: %{},
                   key: nil,
                   children: ["Hi there!"]
                 }
               ]
             }
    end
  end
end
