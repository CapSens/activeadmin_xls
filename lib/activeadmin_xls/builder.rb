module ActiveadminXls
  class Builder
    attr_reader :resource_class, :collection

    def initialize(resource_class, collection)
      configuration!
      @resource_class = resource_class
      @collection = collection
    end

    def call
      [filename, file]
    end

    def file
      ::Axlsx::Package.new do |package|
        loop do
          resources = collection.page(@page).per(@per)

          break unless resources.present?

          package.workbook.add_worksheet(name: "Page - #{@page}") do |sheet|
            sheet.add_row localized_columns
            resources.each do |resource|
              sheet.add_row(columns.map { |column| resource.try(column) })
            end
          end

          @page += 1
        end
        package.use_shared_strings = true
      end
    end

    def columns
      resource_class.attribute_names.reject { |c| @delete_columns.include? c }
    end

    def localized_columns
      columns.map do |column|
        resource_class.human_attribute_name(column)
      end
    end

    def filename
      "#{resource_class.to_s.tr('_', '-')}-#{Time.now.strftime('%Y-%m-%d')}.xlsx"
    end

    private

    def configuration!
      configuration = Rails.application.config.activeadmin_xls
      @per = configuration.per
      @delete_columns = configuration.delete_columns.map(&:to_s)
      @page = 1
    end
  end
end
