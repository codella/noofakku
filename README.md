<img src="https://raw.github.com/mcodella/noofakku/master/resources/icon.png" height='64'>  Noofakku
===============
<a href="http://badge.fury.io/rb/noofakku"><img src="https://badge.fury.io/rb/noofakku@2x.png" alt="Gem Version" height='18'></a>
<br/>
<a href="https://travis-ci.org/mcodella/noofakku"><img src="https://travis-ci.org/mcodella/noofakku.png?branch=master" alt="Travis-CI Status" height='18'></a>
<br/>
<a href="https://codeclimate.com/github/mcodella/noofakku"><img src="https://codeclimate.com/github/mcodella/noofakku.png"  height='18'/></a>
<br/>
<a href='https://coveralls.io/r/mcodella/noofakku'><img src='https://coveralls.io/repos/mcodella/noofakku/badge.png' alt='Coverage Status' height='18'/></a>

Usage Samples
=============

```ruby
require 'noofakku'

input = -> { 0 }
produced = ''
output = ->value { produced << value }

# will print "Hello World!\n"
program = '++++++++++[>+++++++>++++++++++>+++>'
program << '+<<<<-]>++.>+.+++++++..+++.>++.<<++'
program << '+++++++++++++.>.+++.------.--------.>+.>.'

Noofakku::VM.start(program, input, output)

p produced #=> "Hello World!\n"
```

```ruby
require 'noofakku'

to_be_sorted = [5, 3, 2, 6, 0].each
input = -> { to_be_sorted.next }
produced = []
output = ->value { produced << value }

# will sort the zero-ended array in input
program = '>>,[>>,]<< [[-<+<]>[>[>>]<[.[-]<[[>>+<<-]<]>>]>]<<]'

Noofakku::VM.start(program, input, output)

p produced #=> [2, 3, 5, 6]
```

Other usage samples can be found in https://github.com/mcodella/noofakku/blob/master/test/noofakku_smoke_test.rb
