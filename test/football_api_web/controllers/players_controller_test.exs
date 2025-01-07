defmodule FootballApiWeb.PlayersControllerTest do
  use FootballApiWeb.ConnCase

  import FootballApi.FootballFixtures

  @create_attrs %{name: "some name", position: "some position", surname: "some surname", birthyear: 42, nationality: "some nationality"}
  @update_attrs %{name: "some updated name", position: "some updated position", surname: "some updated surname", birthyear: 43, nationality: "some updated nationality"}
  @invalid_attrs %{name: nil, position: nil, surname: nil, birthyear: nil, nationality: nil}

  describe "index" do
    test "lists all players", %{conn: conn} do
      conn = get(conn, ~p"/players")
      assert html_response(conn, 200) =~ "Listing Players"
    end
  end

  describe "new players" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/players/new")
      assert html_response(conn, 200) =~ "New Players"
    end
  end

  describe "create players" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/players", players: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/players/#{id}"

      conn = get(conn, ~p"/players/#{id}")
      assert html_response(conn, 200) =~ "Players #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/players", players: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Players"
    end
  end

  describe "edit players" do
    setup [:create_players]

    test "renders form for editing chosen players", %{conn: conn, players: players} do
      conn = get(conn, ~p"/players/#{players}/edit")
      assert html_response(conn, 200) =~ "Edit Players"
    end
  end

  describe "update players" do
    setup [:create_players]

    test "redirects when data is valid", %{conn: conn, players: players} do
      conn = put(conn, ~p"/players/#{players}", players: @update_attrs)
      assert redirected_to(conn) == ~p"/players/#{players}"

      conn = get(conn, ~p"/players/#{players}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, players: players} do
      conn = put(conn, ~p"/players/#{players}", players: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Players"
    end
  end

  describe "delete players" do
    setup [:create_players]

    test "deletes chosen players", %{conn: conn, players: players} do
      conn = delete(conn, ~p"/players/#{players}")
      assert redirected_to(conn) == ~p"/players"

      assert_error_sent 404, fn ->
        get(conn, ~p"/players/#{players}")
      end
    end
  end

  defp create_players(_) do
    players = players_fixture()
    %{players: players}
  end
end
