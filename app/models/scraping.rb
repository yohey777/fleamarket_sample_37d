class Scraping
  def self.insert_category
    agent = Mechanize.new
    page = agent.get("https://www.mercari.com/jp/")
    cate_page = page.search(".pc-header-nav li")
    elements = cate_page[0].search(".pc-header-nav-parent")

    l_id = 0
    m_id = 0

    elements.each do |l_ele|
      l_cate = l_ele.at("h3 a").inner_text

      l_category = L_category.new(name: l_cate)
      l_category.save

      l_id += 1

      m_cate_pages = l_ele.search(".pc-header-nav-child")

      m_cate_pages.each do |m_ele|
        m_cate = m_ele.at("a").inner_text

        m_category = M_category.new(name: m_cate, l_category_id: l_id)
        m_category.save

        m_id += 1

        s_cate_pages = m_ele.search(".pc-header-nav-grand-child")

        s_cate_pages.each do |s_ele|
          s_cate = s_ele.at("a").inner_text

          s_category = S_category.new(name: s_cate, m_category_id: m_id)
          s_category.save
        end
      end
    end

  end
end


