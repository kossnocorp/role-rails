# Role Rails [![Build Status](https://travis-ci.org/razum2um/role-rails.png?branch=master)](https://travis-ci.org/razum2um/role-rails)

Rails adapter for [Role.js](https://github.com/kossnocorp/role)

## Usage

### Basic usage

``` html
<div role='button'></div>
```

``` js
$('@button');
//=> <div role='button'></div>
```

For more information, read [role.js's README](https://github.com/kossnocorp/role/blob/master/README.md).

### Support for slim shortcuts

If you are using [slim](http://slim-lang.com/) or [skim](https://github.com/jfirebaugh/skim) role-rails will provide `@` shortcut for you.

It works like regular `#` (id) or `.` (class) shortcut.

For this example:

``` slim
@behaviour Trololo
```

... output will be like:

``` html
<div role="behaviour">Trololo</div>
```

You can also combine other shortcuts in any order you want:

``` slim
#some-id.class-name@role
```

## Installation

``` ruby
gem 'role-rails'
```

``` sh
$ bundle
```

For regular role.js version:

``` js
//= require jquery.role
```

For jQuery-free version (which patches `querySelector*`):

``` js
//= require role
```

## Roadmap

### 1.5.0

* Support for custom role attributes (like `@role-name` to `.js-role-name` or `data-role='role-name'`).

## Changelog

### 1.4.0

* Fix deprication warning caused by fresh [slim](http://slim-lang.com/) [#5](https://github.com/kossnocorp/role-rails/pull/5) [#6](https://github.com/kossnocorp/role-rails/pull/6),
* from this version `role-rails` version number no more reflect to role.js version (because it has independent features like support for slim's shortcuts).

## License

The MIT License

Copyright (c) 2011 Sasha Koss

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
