class ResultsContext

  def get
    results = Category.all.map do |c|
      results = Vote.where(category: c).map { |v| { v.nominee.user => 1 } }.reduce() do |a, e|
        key = e.keys.first
        val = e[key]
        val += a[key] if a.key?(key)
        a[key] = val
        a
      end
      ordered = []
      ordered = results.sort_by { |_key, value| -value } if results
      { category: c.title, results: results, 
        ordered_results: ordered }
    end
    most_voted = results.map { |a| a[:ordered_results][0] ? { a[:ordered_results][0][0] => 1 } : nil }.compact.reduce() do |a, e|
      key = e.keys.first
      val = e[key]
      val += a[key] if a.key?(key)
      a[key] = val
      a
    end
    ordered = most_voted.sort_by { |_key, value| -value } 
    results = [{ category: 'El ganador/a', results: most_voted, ordered_results: ordered }] + results
    results
  end

end