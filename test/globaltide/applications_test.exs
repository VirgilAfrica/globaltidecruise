defmodule Globaltide.ApplicationsTest do
  use Globaltide.DataCase

  alias Globaltide.Applications

  describe "applications" do
    alias Globaltide.Applications.Application

    import Globaltide.ApplicationsFixtures

    @invalid_attrs %{type_of_job: nil, email: nil, phone: nil, cv_upload: nil}

    test "list_applications/0 returns all applications" do
      application = application_fixture()
      assert Applications.list_applications() == [application]
    end

    test "get_application!/1 returns the application with given id" do
      application = application_fixture()
      assert Applications.get_application!(application.id) == application
    end

    test "create_application/1 with valid data creates a application" do
      valid_attrs = %{type_of_job: "some type_of_job", email: "some email", phone: "some phone", cv_upload: "some cv_upload"}

      assert {:ok, %Application{} = application} = Applications.create_application(valid_attrs)
      assert application.type_of_job == "some type_of_job"
      assert application.email == "some email"
      assert application.phone == "some phone"
      assert application.cv_upload == "some cv_upload"
    end

    test "create_application/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Applications.create_application(@invalid_attrs)
    end

    test "update_application/2 with valid data updates the application" do
      application = application_fixture()
      update_attrs = %{type_of_job: "some updated type_of_job", email: "some updated email", phone: "some updated phone", cv_upload: "some updated cv_upload"}

      assert {:ok, %Application{} = application} = Applications.update_application(application, update_attrs)
      assert application.type_of_job == "some updated type_of_job"
      assert application.email == "some updated email"
      assert application.phone == "some updated phone"
      assert application.cv_upload == "some updated cv_upload"
    end

    test "update_application/2 with invalid data returns error changeset" do
      application = application_fixture()
      assert {:error, %Ecto.Changeset{}} = Applications.update_application(application, @invalid_attrs)
      assert application == Applications.get_application!(application.id)
    end

    test "delete_application/1 deletes the application" do
      application = application_fixture()
      assert {:ok, %Application{}} = Applications.delete_application(application)
      assert_raise Ecto.NoResultsError, fn -> Applications.get_application!(application.id) end
    end

    test "change_application/1 returns a application changeset" do
      application = application_fixture()
      assert %Ecto.Changeset{} = Applications.change_application(application)
    end
  end
end
