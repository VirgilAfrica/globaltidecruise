defmodule GlobaltideWeb.ApplicationLiveTest do
  use GlobaltideWeb.ConnCase

  import Phoenix.LiveViewTest
  import Globaltide.ApplicationsFixtures

  @create_attrs %{job_name: "some job_name", cv: "some cv", cover_letter: "some cover_letter"}
  @update_attrs %{job_name: "some updated job_name", cv: "some updated cv", cover_letter: "some updated cover_letter"}
  @invalid_attrs %{job_name: nil, cv: nil, cover_letter: nil}

  defp create_application(_) do
    application = application_fixture()
    %{application: application}
  end

  describe "Index" do
    setup [:create_application]

    test "lists all applications", %{conn: conn, application: application} do
      {:ok, _index_live, html} = live(conn, ~p"/applications")

      assert html =~ "Listing Applications"
      assert html =~ application.job_name
    end

    test "saves new application", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/applications")

      assert index_live |> element("a", "New Application") |> render_click() =~
               "New Application"

      assert_patch(index_live, ~p"/applications/new")

      assert index_live
             |> form("#application-form", application: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#application-form", application: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/applications")

      html = render(index_live)
      assert html =~ "Application created successfully"
      assert html =~ "some job_name"
    end

    test "updates application in listing", %{conn: conn, application: application} do
      {:ok, index_live, _html} = live(conn, ~p"/applications")

      assert index_live |> element("#applications-#{application.id} a", "Edit") |> render_click() =~
               "Edit Application"

      assert_patch(index_live, ~p"/applications/#{application}/edit")

      assert index_live
             |> form("#application-form", application: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#application-form", application: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/applications")

      html = render(index_live)
      assert html =~ "Application updated successfully"
      assert html =~ "some updated job_name"
    end

    test "deletes application in listing", %{conn: conn, application: application} do
      {:ok, index_live, _html} = live(conn, ~p"/applications")

      assert index_live |> element("#applications-#{application.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#applications-#{application.id}")
    end
  end

  describe "Show" do
    setup [:create_application]

    test "displays application", %{conn: conn, application: application} do
      {:ok, _show_live, html} = live(conn, ~p"/applications/#{application}")

      assert html =~ "Show Application"
      assert html =~ application.job_name
    end

    test "updates application within modal", %{conn: conn, application: application} do
      {:ok, show_live, _html} = live(conn, ~p"/applications/#{application}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Application"

      assert_patch(show_live, ~p"/applications/#{application}/show/edit")

      assert show_live
             |> form("#application-form", application: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#application-form", application: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/applications/#{application}")

      html = render(show_live)
      assert html =~ "Application updated successfully"
      assert html =~ "some updated job_name"
    end
  end
end
