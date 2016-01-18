defmodule IndefiniteArticleTest do
  use ExUnit.Case
  doctest IndefiniteArticle

  @an_words ~w{
    apple
    unassailable
    ubuntu
    ubersexual
    ungrammatical
    unanswered
    unilluminated
    unintentional
    unlikely
    honor
    honorable
    onerous
    hour
    honest
    heir
    utter
    urgent
    a e f h i l m n o r s x
    8 11
  }

  @a_words ~w{
    ukulele
    UN
    uk
    oaxaca
    oaxacan
    oaxacania
    oaxacanthaxia
    ufo
    unanimous
    one
    onearmed
    once
    onetime
    ouija
    european
    ewe
    ubiquity
    uboat
    unicorn
    unilateral
    banana
    user
    useful
    urinologist
    urea
    b c d g j k p q t u v w y z
    1 2 3 4 5 6 7 9 10 12 13 14 15 16 17 18 19 20
  }

  test "an words" do
    for word <- @an_words do
      assert IndefiniteArticle.get(word) == "an", "word: #{word}"
      assert IndefiniteArticle.get(String.upcase(word) ) == "an", "word: #{String.upcase(word)}"
    end
  end

  test "a words" do
    for word <- @a_words do
      assert IndefiniteArticle.get(word) == "a", "word: #{word}"
      assert IndefiniteArticle.get(String.upcase(word) ) == "a", "word: #{String.upcase(word)}"
    end
  end

  test "case sensetivity" do
    assert IndefiniteArticle.get("bananna") == "a"
    assert IndefiniteArticle.get("Bananna") == "a"

    assert IndefiniteArticle.get("apple") == "an"
    assert IndefiniteArticle.get("Apple") == "an"
  end

  test "phrases" do
    assert IndefiniteArticle.get("banana of yummieness") == "a"
    assert IndefiniteArticle.get("honor-seeking person") == "an"
  end

  test "with a symbol" do
    assert IndefiniteArticle.get(:banana) == "a"
  end

  test "empty string" do
    assert IndefiniteArticle.get("") == ""
  end

  test "nil string" do
    assert IndefiniteArticle.get(nil) == ""
  end

  test "prepend words" do
    assert IndefiniteArticle.prepend("banana") == "a banana"
    assert IndefiniteArticle.prepend("apple") == "an apple"
  end
end
