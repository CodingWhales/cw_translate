  # CwTranslate
An extensible translation API, and executable command ;)

## Features

* Simple [translation API](#translation-api).
* Configurable source of translation. See [Bundled Translators](#bundled-translators)
* Caching Support. See [Bundled Caches](#bundled-caches)
* Extensible with your implementation of `CwTranslate::Translator` and `CwTranslate::Cache`
* Executable from the command line. See [using executable](#using-executable)
* Integrable with Rails. See [using with Rails](#using-with-rails)

## Getting started

### Installation

Install the gem:

```bash
gem install `cw_translate`
```

or add it to your project Gemfile:

```ruby
gem 'cw_translate'
```

### Configuration

[TBD]

### Translation API
`CwTranslate` module provides a quick initialization method of a `CwTranslate::Translate` class, using configuration files (see [Configuration](#configuration)).

```ruby
t = CwTranslate.init
```

An instance of `CwTranslate::Translate` can be initialized directly too:
```ruby
t = CwTranslate::Translate.new('en', 'de', yandex_translator, file_cache)
```

Once initialized, an instance of `CwTranslate::Translate` is ready to translate text:
```ruby
t.translate 'hello' # > 'hallo'
t.translate 'hello', false # > 'hallo'
```

### Bundled Translators

The following transaltor implementations are bundled with the gem:

- [YandexTranslator](/lib/cw_translate/translator/yandex/translator.rb): Uses [Yandex Translate API](https://tech.yandex.com/translate/)

### Bundled Caches

The following cache implementations are bundled with the gem:

- [RedisCache](/lib/cw_translate/cache/redis/cache.rb): Uses [Redis](https://redis.io/) for caching.

## Usage

### Using executable

### Using with Rails

## Documentation
This gem is documented using [YARD](https://yardoc.org/).

Check [generated documentation](/docs/index.md)

## Contributing


## Code of Conduct

Everyone interacting in the CwTranslate project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/CodingWhales/cw_translate/blob/master/CODE_OF_CONDUCT.md).
