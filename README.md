## EnigmaRuby

[![Minitest](https://github.com/chibicco/enigma_ruby/actions/workflows/minitest.yml/badge.svg)](https://github.com/chibicco/enigma_ruby/actions/workflows/minitest.yml)

EnigmaRuby faithfully recreates the functionality of the historical Enigma machine in Ruby. 
This gem allows you to encrypt and decrypt messages using customizable rotors, reflectors, and plugboards, offering a hands-on experience with classic cryptographic techniques.

### Installation

Add this line to your application's Gemfile:

```ruby
gem 'enigma_ruby'
```

And then execute:

```shell
$ bundle install
```

Or install it yourself as:

```shell
$ gem install enigma_ruby
```

### Usage

```rub
require 'enigma_ruby'

EnigmaRuby.encrypt('HELLO WORLD')
```

### References

- [Enigma Machine - Wikipedia](https://en.wikipedia.org/wiki/Enigma_machine)
- [The_Imitation_Game](https://en.wikipedia.org/wiki/The_Imitation_Game)

### License

The gem is available as open source under the terms of the MIT License.
