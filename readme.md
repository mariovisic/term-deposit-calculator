# Term deposit calculator

This term deposit calculator is written in ruby.

It only returns whole dollar amounts, the same behaviour as: https://www.bendigobank.com.au/calculators/deposit-and-savings/ though this can easily be changed as the raw calculated value is preserved until presentation time

## Running the tests

Minitest is used as the testing framework, you can install it by running:

```
gem install minitest
```

Once installed you can execute the test suite by running:

```
ruby calculator_tests.rb
```

## Running the program

You can run the calculator by executing:

```
ruby calculator_cli.rb
```


### Considerations and improvements

I only spent a short amount of time working on this calculator and it's not great in a number of ways, with more time it could be improved, here are some things that could be nicer:

- The CLI input is a bit basic and cumbersome and needs more testing. I did all of my testing as unit tests against the calculator class and so i'm sure there may be errors with the CLI, even as basic as it is. I think it's also a bit clumsy, maybe it would be nice instead to pass arguments on the command line instead? That way you could easily re-run the calculator with different values as it's much faster than typing them out manually each time.

- The use of BigDecimal needs a bit more thought. Ruby's native floating point number system uses doubles which already has a lot of precision but I thought i'd like to use BigDecimal to keep as much precision as possible, avoiding any floating point errors. Only at the final stage of the program outputting a floating point number.
I've tried to ensure that any partial number that is represented in the program be a BigDecimal type but whole numbers are kept as integers. I think it could be easy to introduce rounding bugs by introducing a float, there aren't any tests or checks against this. Perhaps using integer cents could be a viable alternative. Or even the ruby money gem, though I was trying to minimise any external libraries ... in any case, the whole money handling issue needs more thought

- The bulk of the program logic is in the Calculator#calculate method. Potentially this could be refactored, but the program itself is reasonable simple and so perhaps not neccessary. Moving the periods calculation to another method could be an easy way to split things out.

- The output of the program tries to match that of the Bendigo calculator, which outputs whole dollar amounts and rounds values. Depending on how the calculator is to be used it might be sensible to instead output cents or remove rounding for example to make it a better fit for purpose