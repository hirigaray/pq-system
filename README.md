# pq-system

This is a simple parser for the pq-system as described in Chapter 2 of
Gödel, Escher, Bach by Douglas R. Hofstadter.

### Examples

##### These should evaluate to true
    (valid-theorem? '(- - p - - q - - - -))
    (valid-theorem? '(- - p - - - q - - - - -))

##### These should evaluate to false
    (valid-theorem? '(- - p - - q - - - - -))
    (valid-theorem? '(- p - - - q -))

##### These should produce
    (produce-theorem 2 3) -> '(- - p - - - q - - - - -)
    (produce-theorem 4 5) -> '(- - - - p - - - - - q - - - - - - - - -)
