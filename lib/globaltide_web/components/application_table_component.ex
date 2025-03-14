defmodule GlobaltideWeb.ApplicationTableComponent do
  use Phoenix.Component

  def application_table(assigns) do
    ~H"""
    <div class="w-full overflow-x-auto">
      <h2 class="text-2xl font-bold mb-4">My Applications</h2>

      <table class="min-w-full border-collapse border border-gray-300">
        <thead>
          <tr class="bg-gray-100 text-left">
            <th class="border p-3 text-sm sm:text-base">Job Title</th>
            <th class="border p-3 text-sm sm:text-base">Status</th>
          </tr>
        </thead>
        <tbody>
          <%= for application <- @applications do %>
            <tr class="border text-sm sm:text-base">
              <td class="border p-3"><%= application.type_of_job %></td>
              <td class="border p-3">
                <%= case application.status do %>
                  <% "pending" -> %>
                    <span class="text-yellow-500 font-medium">Pending</span>
                  <% "approved" -> %>
                    <span class="text-green-500 font-medium">Approved</span>
                  <% "rejected" -> %>
                    <span class="text-red-500 font-medium">Rejected</span>
                  <% _ -> %>
                    <span class="text-gray-500 font-medium">Unknown</span>
                <% end %>
              </td>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end
end
