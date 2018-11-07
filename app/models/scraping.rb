class Scraping
  def self.insert_brands

    agent = Mechanize.new
    page = agent.get("https://www.mercari.com/jp/brand/")
    elements= page.search(".brand-list-initial-box-brand-name p")

    brand_arry = []

    elements.each do |ele|
      brand_arry << ele.inner_text
    end

    brand_arry.each do |ary|
      brand_name = ary
      brand = Brand.new(name: brand_name)
      brand.save
    end

  end
end


