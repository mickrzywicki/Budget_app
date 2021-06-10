module ApplicationHelper
  def prepare_data_for_selector(col)
    col.map do |el|
      [el.select_option_presenter, el.id]
    end
  end
end
