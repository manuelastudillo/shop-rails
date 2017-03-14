class Search
 def initialize(page, page_size, keywords)
  @page = page
  @page_size = page_size
  @offset = page_size * page
  @keywords = keywords
 end


 def brands_by_nombre
  if @keywords.present?
   brands = Brand.where(nombre_condition).order(:nombre).offset(@offset).limit(@page_size)
   @number_of_records = Brand.where(nombre_condition).count
  else
   brands = Brand.order(:nombre).offset(@offset).limit(@page_size)
   @number_of_records = Brand.count
  end
 
  return brands, number_of_pages
 end

  def categories_by_nombre
    if @keywords.present?
        categories = Category.where(nombre_condition).order(:nombre).offset(@offset).limit(@page_size)
        @number_of_records = Category.where(nombre_condition).count
      else
        categories = Category.order(:nombre).offset(@offset).limit(@page_size)
        @number_of_records = Category.count
      end
      
      return categories, number_of_pages
  end

  def units_by_nombre
   if @keywords.present?
     units = Unit.where(nombre_condition).order(:nombre).offset(@offset).limit(@page_size)
     @number_of_records = Unit.where(nombre_condition).count
   else
     units = Unit.order(:nombre).offset(@offset).limit(@page_size)
     @number_of_records = Unit.count
   end
 
   return units, number_of_pages
 end

 private

 def nombre_condition
  nombre_condition = "unaccent(lower(nombre)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'"
 end

 def number_of_pages
  number_of_pages = (@number_of_records % @page_size) == 0 ? 
  @number_of_records / @page_size - 1 : @number_of_records / @page_size
 end
end