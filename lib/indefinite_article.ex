defmodule IndefiniteArticle do
  @a_requiring_patterns ~r/^(([bcdgjkpqtuvwyz]|onc?e|onearmed|onetime|ouija|oaxaca|oaxacan|oaxacania|oaxacanthaxia)$|e[uw]|uk|ubi|ubo|ufo|ur[aeiou]|use|ut([^t])|unani|uni(l[^l]|[a-ko-z]))/i
  @an_requiring_patterns ~r/^([aefhilmnorsx]$|hono|honest|hour|heir|[aeiou]|8|11)/i
  @upcase_a_requiring_patterns ~r/^(UN$)/
  @upcase_an_requiring_patterns ~r/^([aefhilmnorsx]$|hono|honest|hour|heir|[aeiou]|8|11)/i

  def get(str) do
    str = "#{str}"
    if str == nil || str == "" do
      ""
    else
      [first_word | _] = Regex.split(~r/[- ]/, str)

      matches_an = Regex.match?(@an_requiring_patterns, first_word) || Regex.match?(@upcase_an_requiring_patterns, first_word)
      matches_a = Regex.match?(@a_requiring_patterns, first_word) || Regex.match?(@upcase_a_requiring_patterns, first_word)

      if matches_an && !matches_a do
        "an"
      else
        "a"
      end
    end
  end

  def prepend(str) do
    "#{get(str)} #{str}" 
  end
end
