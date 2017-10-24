defmodule Servy.BearController do

  alias Servy.Wildthings

  defp bear_item(bear) do
    "<li>#{bear.name} - #{bear.type}</li>"
  end

  def index(conv) do
    items = 
      Wildthings.list_bears()
      |> Enum.filter(fn(b) -> b.type === "Grizzly" end)
      |> Enum.sort(fn(b1, b2) -> b1.name <= b2.name end)
      |> Enum.map(fn(b) -> bear_item(b) end )
      |> Enum.join

    %{ conv | status: 200, resp_body: "<ul>#{items}</ul>" } 
  end

  def show(conv, %{ "id" => id }) do
    bear = Wildthings.get_bear(id)
    %{ conv | status: 200, resp_body: "<h1>Bear #{bear.id}: #{bear.name}</h1>" }
  end

  def create(conv, %{"type" => type, "name" => name} = params) do
    %{ conv | status: 201, resp_body: "Created a #{type} bear named #{name}!" }
  end
end