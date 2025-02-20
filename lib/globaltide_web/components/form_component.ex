defmodule GlobaltideWeb.FormComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="p-6 bg-white rounded shadow-md">
      <h2 class="text-xl font-bold mb-4">Submit Your Application</h2>

      <form phx-submit="save">
        <div class="mb-6 border-b pb-4">
          <h3 class="text-lg font-semibold">1. Policy Agreement</h3>
          <p class="text-sm text-gray-600 mb-2">
            Please read and accept our policy before proceeding.
          </p>
          <label class="inline-flex items-center">
            <input
              type="checkbox"
              name="application[policy_agreed]"
              id="policy_agreed"
              class="mr-2"
              required
            />
            <span class="text-sm text-gray-700">I agree to the terms and conditions</span>
          </label>
        </div>

        <div class="mb-6 border-b pb-4">
          <h3 class="text-lg font-semibold">2. Personal Information & Job Details</h3>

          <div class="mb-4">
            <label class="block text-gray-700">Full Name</label>
            <input
              type="text"
              name="application[name]"
              class="w-full p-2 border border-gray-300 rounded"
              required
            />
          </div>

          <div class="mb-4">
            <label class="block text-gray-700">Email Address</label>
            <input
              type="email"
              name="application[email]"
              class="w-full p-2 border border-gray-300 rounded"
              required
            />
          </div>

          <div class="mb-4">
            <label class="block text-gray-700">Phone Number</label>
            <input
              type="text"
              name="application[phone]"
              class="w-full p-2 border border-gray-300 rounded"
              required
            />
          </div>

          <div class="mb-4">
            <label class="block text-gray-700">Job Position Applied For</label>
            <input
              type="text"
              name="application[position]"
              class="w-full p-2 border border-gray-300 rounded"
              value={@job_title}
              readonly
            />
          </div>

          <div class="mb-4">
            <label class="block text-gray-700">Cover Letter</label>
            <textarea
              name="application[cover_letter]"
              class="w-full p-2 border border-gray-300 rounded h-24"
            ></textarea>
          </div>
        </div>

        <div class="mb-6">
          <h3 class="text-lg font-semibold">3. Visa/Passport Information</h3>

          <div class="mb-4">
            <label class="block text-gray-700">Passport Number</label>
            <input
              type="text"
              name="application[passport_number]"
              class="w-full p-2 border border-gray-300 rounded"
              required
            />
          </div>

          <div class="mb-4">
            <label class="block text-gray-700">Current Visa Status</label>
            <input
              type="text"
              name="application[visa_status]"
              class="w-full p-2 border border-gray-300 rounded"
              required
            />
          </div>

          <div class="mb-4">
            <label class="block text-gray-700">Passport/Visa Expiry Date</label>
            <input
              type="date"
              name="application[expiry_date]"
              class="w-full p-2 border border-gray-300 rounded"
              required
            />
          </div>
        </div>

        <button type="submit" class="mt-4 bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700">
          Submit Application
        </button>
      </form>
    </div>
    """
  end
end
