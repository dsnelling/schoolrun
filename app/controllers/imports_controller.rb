# for import of events file, as CSV
#
# note that import is specified as as singular resource, as no ID

require 'csv'
class ImportsController < ApplicationController
  before_filter :check_admin

  def new
  # displays form only
  end

  def create
    @rows_read, @rows_imported, @errs = 0, 0, []
    if request.post? && params[:csv_file].present?
      uploaded_io = params[:csv_file].read
      CSV.parse(uploaded_io, {:headers => true, :skip_blanks => true} ) do |row|
        @rows_read += 1
        begin
          e = Event.new(row.to_hash)
        rescue ActiveRecord::UnknownAttributeError
          flash[:notice] = "Invalid CSV file, row #{@rows_read}"
          @errs << "Invalid CSV file, row #{@rows_read}"
        else
          if  e.valid?
            e.save
            @rows_imported += 1
          else
            @errs << "Invalid CSV file, row #{@rows_read}"
          end
        end
      end

      if @errs.any?
        flash[:notice] = "Errors in CSV file upload - not all rows saved"
      else
        flash[:notice] = "#{@rows_imported} events successfully imported"
        redirect_to events_url
      end
    else
      redirect_to new_import_path
    end
  end

  def show
  end

  private
    def check_admin
      redirect_to events_path unless @is_admin
    end

end
