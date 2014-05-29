### 1.0.0
#### Additions
* Added tags endpoint, tags object to Articles
* Added generic `kpcc.Query()` function.
* Added `all()` function to models which can return all objects.
* Added 'meta' argument to query callbacks, which contains the 'meta' node from the API.

#### Changes
* [BREAKING] Changed `most_viewed`, `most_commented`, and `by_url` to `mostViewed`, `mostCommented`, and `byUrl`.

#### Fixes
* Fixed nested objects


### 0.3.1
#### Fixes
* Fix Blog class to use correct endpoint/keys


### 0.3.0
#### Additions
* Added "simple" response format to DataPoints
* Added "by_url", "most_viewed", "most_commented" endpoints for `Articles`
* Added "at", "current" endpoints to `Schedule`

#### Fixes
* Fixed error if nested object was missing

#### Changes
* Changed `ScheduleOccurrence` to `Schedule`


### 0.2.1
* Fix ApiEntity#query()


### 0.2.0
* Bug fixes
* Add release script


### 0.1.0
* Initial Release
