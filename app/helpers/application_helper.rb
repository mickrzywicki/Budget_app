module ApplicationHelper
  def prepare_data_for_selector(col)
    col.map do |el|
      [el.select_option_presenter, el.id]
    end
  end

  def index_in_records_table(num_page)
    num_page ? (num_page.to_i * 10) - 10 : 0
  end
end
