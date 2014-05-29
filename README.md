## KPCC.js

A javascript client for the KPCC api **version 3 only**.

API Documentation: https://github.com/SCPR/api-docs/blob/master/KPCC/v3/

All query parameters from this library are sent as-is to the API.


### Dependencies
* jQuery (tested with 1.x)


### Usage
Every API endpoint is represented in this library. Each object representing an API endpoint (eg. `Article`, `Blog`, `Program`) has two primary methods for searching: `find` and `query`. Both methods take a callback which will be called on success.

Neither method does any empty/null checks, so you should do it in your success callback.

#### `find`
`find()` takes an ID (whether it's numerical or a UUID), and its success callback is bound to the single object returned (if any).

```javascript
kpcc.Article.find("news_stories-999", function() {
    // `this` is a kpcc.Article object (or null)
    if (!this) return; // Or do something less subtle

    console.log(this.title)
    console.log(this.teaser)
})
```

#### `query`
`query()` takes an object of parameters to send with the API request, and its success callback is bound to the *collection* returned (an array).

```javascript
kpcc.Article.query({ categories: "film,music", limit: 10 } function() {
    // `this` is an Array of kpcc.Article objects
    for (var i = 0; i < this.length; i++) {
        var article = this[i];

        console.log(article.title)
        console.log(article.teaser)
    }
})
```

##### Note: `DataPoint` "simple" request format
For `kpcc.DataPoint`, if you pass the `request_format: "simple"` parameter to `query()`, its callback will just receive a plain object, eg:

```json
// request_format: simple
{
    "percent_reporting": "87",
    "percent_yes": "56",
    "percent_no": "25"
}
```

This only applies to `DataPoint`. If you don't pass a `request_format` parameter or set it to `full` (the default), callback will be bound normally. See the [Data Points API documentation](https://github.com/SCPR/api-docs/blob/master/KPCC/v3/endpoints/data_points.md) for more information.


##### Note: `Schedule.find()` usage/alias
For `kpcc.Schedule`, `find()` is an alias for `at()`, which accepts a time to lookup:

```javascript
// These two lines are identical:
kpcc.Schedule.find(new Date().getTime(), function() { ... })
kpcc.Schedule.at(new Date().getTime(), function() { ... })
```

#### `all()` (only available on some endpoints)
Some endpoints provide a convenience method, `all()`, which is a shorthand way to query the endpoint without any parameters and return all objects.

The classes which support this function are:
* Blog
* Bucket
* Category
* Program
* Tag

```javascript
Blog.all(function() {
    // `this` is the collection of all Blogs
    console.log(this.length) // Blog count
})
```

#### Special Endpoints
##### `Schedule.current()`
Returns the currently-airing program/event.  
Callback is bound to a single Schedule object.

##### `Schedule.at(Number)`
Pass in a unix timestamp to get the program on at that time.  
Callback is bound to a single Schedule object.

##### `Article.mostViewed()`
Returns the popular (by views) articles.  
Callback is bound to an Article collection.

##### `Article.mostCommented()`
Returns the popular (by comment count) articles.  
Callback is bound to an Article collection.

##### `Article.byUrl(String)`
Get an article object by its public URL.  
Callback is bound to a single Article object.

#### Generic Querying
You can also send a generic query to the API. This allows you to manipulate the API query or use brand new API features (before this lib is updated to reflect those features), but you will miss some of the automatic attribute assignment and niceties. The callback gets bound to the raw response object.

```javascript
kpcc.Query("articles", { categories: "politics" }, function() {
    // 'this' is the raw response data.
    articles = this.articles

    for (var i = 0; i < articles.length; i++) {
        var article = articles[i];

        console.log(article.title)
        console.log(article.teaser)
    }
})

kpcc.Query("tags/elections-2014", {}, function() {
    tag = this.tag
    console.log(tag.title)
})
```

#### Accessing request metadata
Each API response from KPCC comes with a root-level `meta` object. This object is passed to your request callback as an argument, which you can use if you want.

```javascript
kpcc.Article.find("news_stories-999", function(meta) {
    console.log(meta.version) // The API version
    console.log(meta.status.message)

    if (meta.status.code == 200) {
        console.log("Successful request!")
    } else {
        console.log("Something went wrong: " + meta.status.message)
    }
})
```


### Testing
Open the files in the `test/` directory and check for errors. These are tested against the live KPCC API. You can also run it again a local server, just change `kpcc.API_ROOT` while testing.

### Building
```
bundle install
bundle exec ruby build.rb
```

Alternatively (and preferably), you can just run Guard (via `bundle exec guard`), and a development version will be built for you every time you save a coffee file.


### Releasing
```
RELEASE=true bundle exec ruby build.rb
```

It will ask you the version.

### TODO
* Build a stub API server so we can test against known data
* Remove jQuery dependency. The only thing that needs jquery is `$.ajax()` and `$.extend()`, which both only occur once and in the same function.
