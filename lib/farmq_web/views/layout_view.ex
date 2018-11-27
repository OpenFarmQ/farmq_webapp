defmodule FarmQWeb.LayoutView do
  use FarmQWeb, :view

  def get_active_locale_class(locale) do
    if Gettext.get_locale(FarmQWeb.Gettext) == locale do
      "active" 
    end
  end
end
