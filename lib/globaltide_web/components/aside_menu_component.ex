defmodule GlobaltideWeb.AsideMenuComponent do
  use Phoenix.Component

  def aside_menu_component(assigns) do
    ~H"""
    <aside>
      <div>
        hello @current_user
      </div>
    </aside>
    """
  end
end
