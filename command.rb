require 'strscan'

require_relative 'evaluate'
require_relative 'parse'
require_relative 'tokenizer'

class Command
  def evaluate(expression)
    # If the input is just one number don't bother evaluating it
    if expression.scan(/\d+/).size == 1
      return expression.to_i
    end

    # Parse input string
    lexer  = Tokenizer.new
    tokens = lexer.parse(expression)

    # Convert to postfix notation
    parser      = Parser.new(tokens)
    postfix_exp = parser.run

    # Evaluate
    Evaluator.new.run(postfix_exp.output)
  end
end
