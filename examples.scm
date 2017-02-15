; These should evaluate to true
(valid-theorem? '(- - p - - q - - - -))
(valid-theorem? '(- - p - - - q - - - - -))

; These should evaluate to false
(valid-theorem? '(- - p - - q - - - - -))
(valid-theorem? '(- p - - - q -))

; should produce
(produce-theorem 2 3) ; '(- - p - - - q - - - - -)
(produce-theorem 4 5) ; '(- - - - p - - - - - q - - - - - - - - -)
