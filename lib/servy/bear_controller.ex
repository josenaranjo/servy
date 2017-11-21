defmodule Servy.BearController do

  alias Servy.Wildthings
  alias Servy.Bear
  alias Servy.View

  def index(conv) do
    bears = 
      Wildthings.list_bears()
      |> Enum.sort(&Bear.order_ascending_by_name/2)

    View.render(conv, "index.eex", bears: bears)
  end

  def show(conv, %{ "id" => id }) do
    bear = Wildthings.get_bear(id)

    View.render(conv, "show.eex", bear: bear)
  end

  def create(conv, %{"type" => type, "name" => name} = params) do
    %{ conv | status: 201, resp_body: "Created a #{type} bear named #{name}!" }
  end

  def delete(conv, %{"id" => id} = params) do
    bear = Wildthings.get_bear(id)
    %{ conv | status: 200, resp_body: "Bear #{bear.name} was deleted!" }
  end
end