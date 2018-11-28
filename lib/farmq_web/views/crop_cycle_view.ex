defmodule FarmQWeb.CropCycleView do
  use FarmQWeb, :view

  def plant_name(crop_cycle) do
    if crop_cycle.sowing_data do
      crop_cycle.sowing_data.plant.name
    else
      "Sowing data not yet created"
    end
  end

  def seed_weight(crop_cycle) do
    if crop_cycle.sowing_data do
      crop_cycle.sowing_data.seed_weight
    else
      "Sowing data not yet created"
    end
  end

  def sown_date(crop_cycle) do
    if crop_cycle.sowing_data do
      crop_cycle.sowing_data.sown_date
    else
      "Sowing data not yet created"
    end
  end
end
