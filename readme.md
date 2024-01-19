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