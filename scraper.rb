class Scraper
  def title_scraper(url)
    search_results = []
    Nokogiri::HTML(open(url).read).search(".m_titre_resultat").each do |element|
      search_results << element.text.strip
    end
    search_results = search_results.first(5)
  end

  def desc_scraper(url)
    search_results_desc = []
    Nokogiri::HTML(open(url).read).search(".m_texte_resultat").each do |element|
      search_results_desc << element.text.strip
    end
    search_results_desc
  end

  def time_scraper(url)
    search_results_time = []
    Nokogiri::HTML(open(url).read).search(".m_detail_time").each do |element|
      search_results_time << element.text.strip
    end
    search_results_time
  end
end
