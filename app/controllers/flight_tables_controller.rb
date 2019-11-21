class FlightTablesController < ApplicationController
  def index
    @flight_tables = FlightTable.all

    render("flight_table_templates/index.html.erb")
  end

  def show
    @flight_table = FlightTable.find(params.fetch("id_to_display"))

    render("flight_table_templates/show.html.erb")
  end

  def new_form
    @flight_table = FlightTable.new

    render("flight_table_templates/new_form.html.erb")
  end

  def create_row
    @flight_table = FlightTable.new

    @flight_table.description = params.fetch("description")
    @flight_table.time = params.fetch("time")
    @flight_table.user_id = params.fetch("user_id")

    if @flight_table.valid?
      @flight_table.save

      redirect_back(:fallback_location => "/flight_tables", :notice => "Flight table created successfully.")
    else
      render("flight_table_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @flight_table = FlightTable.find(params.fetch("prefill_with_id"))

    render("flight_table_templates/edit_form.html.erb")
  end

  def update_row
    @flight_table = FlightTable.find(params.fetch("id_to_modify"))

    @flight_table.description = params.fetch("description")
    @flight_table.time = params.fetch("time")
    

    if @flight_table.valid?
      @flight_table.save

      redirect_to("/flight_tables/#{@flight_table.id}", :notice => "Flight table updated successfully.")
    else
      render("flight_table_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @flight_table = FlightTable.find(params.fetch("id_to_remove"))

    @flight_table.destroy

    redirect_to("/users/#{@flight_table.user_id}", notice: "FlightTable deleted successfully.")
  end

  def destroy_row
    @flight_table = FlightTable.find(params.fetch("id_to_remove"))

    @flight_table.destroy

    redirect_to("/flight_tables", :notice => "Flight table deleted successfully.")
  end
end
