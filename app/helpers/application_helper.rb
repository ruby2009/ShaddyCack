module ApplicationHelper
  def score_decorator(score)
    if score == 0
      "-"
    elsif score.nil?
      ""
    elsif score.positive?
      "+#{score}"
    else
      score
    end
  end
end
