ruby-upworthy
==============

![license](https://raster.shields.io/badge/license-MIT%20with%20restrictions-green.png)
[![Gem Version](https://badge.fury.io/rb/ruby-upworthy.svg)](http://badge.fury.io/rb/ruby-upworthy)
[![Build Status](https://img.shields.io/github/workflow/status/woodruffw/ruby-upworthy/CI/master)](https://github.com/woodruffw/ruby-upworthy/actions?query=workflow%3ACI)

A clickbait title generator, translated into Ruby from
[Mike Lacher's](http://mikelacher.com/)
[Upworthy Generator](http://www.upworthygenerator.com/).

### Installation

```bash
$ gem install ruby-upworthy
```

### Usage

From Ruby:

```ruby
require 'upworthy'

Upworthy.headline # => "Watch an extroverted police officer become a legend with six words"
```

From the shell:

```bash
$ upworthy
```

### License

This gem is licensed under the MIT License.

For the exact terms see the LICENSE file.
