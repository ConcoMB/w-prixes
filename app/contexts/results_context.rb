class ResultsContext

  def get
    Category.all.map do |c|
      results = Vote.where(category: c).map { |v| { v.nominee.user.name => 1 } }.reduce() do |a, e|
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
  end

end