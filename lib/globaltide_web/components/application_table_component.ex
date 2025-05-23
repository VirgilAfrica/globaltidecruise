defmodule GlobaltideWeb.ApplicationTableComponent do
  use Phoenix.Component

  def application_table(assigns) do
    ~H"""
    <div class="w-full max-w-[90%] mx-auto py-12">
      <h2 class="text-2xl font-bold mb-4">My Applications</h2>

      <table class="min-w-full border-collapse border border-gray-300">
        <thead>
          <tr class="bg-gray-100 text-start">
            <th class="border p-3 text-sm sm:text-base text-start">Job Title</th>
            <th class="border p-3 text-sm sm:text-base text-start">Status</th>
          </tr>
        </thead>
        <tbody class="w-full">
          <%= for application <- @applications do %>
            <tr class="border text-sm sm:text-base">
              <td class="border p-3">
                <%= application.job_listing.job_title %>
              </td>
              <td class="border p-3">
                <%= case String.downcase(application.status) do %>
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
