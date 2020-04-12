# UrlShortener
Url Shortener is a Rails Engine Gem that provides the ability to shorten urls. The gem will generate a migration file and will provide the main functionality for creating short urls and interpreting them as well.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'url_shortener', github: 'ahmadabdelhalim/url_shortener'
```
And then execute:
```bash
$ bundle
```
After you install Url Shortener run the generator:
```bash
$ rails generate url_shortener url_shortener
```
This generator will create a migration to create the url_shortener_shortened_urls table where your shortened URLs will be stored.

## Usage
To instantiate a new object, do the following: 
```ruby
  UrlShortener::ShortenedUrl.new
```
To generate a Shortened URL object for the URL “example.com” within your controller / models do the following:
```ruby
  UrlShortener::ShortenedUrl.create(full_link: "http://example.com")
```
To find the object by ID, do the following: 
```ruby
  UrlShortener::ShortenedUrl.find(1)
```
To find the full url using the shortend link, do the following:
```ruby
  UrlShortener::ShortenedUrl.find_link(shortened_link: "b")
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
