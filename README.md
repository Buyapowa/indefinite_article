# IndefiniteArticle

Gets the indefinite artilce of a word or string of text:

```elixir
IndefiniteArticle.get("banana") # => "a"
IndefiniteArticle.get("apple") # => "an"

IndefiniteArticle.prepend("apple") # => "an apple"
```

## Installation

```elixir
def deps do
  [{:indefinite_article, "~> 0.0.1"}]
end
```

## Acknowledgements

This is a direct Elixir port of https://github.com/rossmeissl/indefinite_article
so any good karma goes to Andy Rossmeissl
