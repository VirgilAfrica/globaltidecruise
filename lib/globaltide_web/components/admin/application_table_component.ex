defmodule GlobaltideWeb.Admin.ApplicationTableComponent do
  use Phoenix.Component

  def table_section(assigns)do
    ~H"""
    <h1 class="text-2xl font-bold mb-4">Job Applications</h1>

    <table class="min-w-full border-collapse border border-gray-300">
      <thead>
        <tr class="bg-gray-100">
          <th class="border p-2">Job Title</th>
          <th class="border p-2">Email</th>
          <th class="border p-2">Phone</th>
          <th class="border p-2">Status</th>
          <th class="border p-2">Actions</th>
        </tr>
      </thead>
      <tbody>
        <%= for application <- @applications do %>
          <tr class="border">
            <td class="border p-2"><%= application.type_of_job %></td>
            <td class="border p-2"><%= application.email %></td>
            <td class="border p-2"><%= application.phone %></td>
            <td class="border p-2">
              <%= if application.approval_status == "pending" do %>
                <span class="text-yellow-500">Pending</span>
              <% else %>
                <span class="text-green-500">Approved</span>
              <% end %>
            </td>
            <td class="border p-2">
              <%= if application.approval_status == "pending" do %>
                <button phx-click="approve" phx-value-id={application.id} class="bg-blue-500 text-white px-3 py-1 rounded">
                  Approve
                </button>
              <% else %>
                <span class="text-gray-400">Approved</span>
              <% end %>
            </td>
          </tr>
        <% end %>
      </tbody>
    </table>
    """
  end
end
