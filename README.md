good-morning-dave
=================

One stop shop for what you need to know for your work-day.

# Goals

Provide an interface for getting morning alerts about:

* Traffic conditions for the input commute
* Weather for the day

## Possible Future Enhancements

* Sync with calendar for the day
  * Adjust time of notification according to meeting schedule
* Adjust notification according to commute time

## "Too Soon to Discuss" Enhancements

* Auth with github
* Persistent DB instead of sqlite

## How

Site will be a stand-alone site that you run locally. All the options
will be setup for a single user, without auth, to modify. The data
model is only to abstract the different preferences like API key
to use and what address to center the map on.

# Phase 0

Embed a map with custom params on a web page with the traffic layer.

# Phase 1

Abstract the map so that we have db fields that fill in things like:

* API key
* Address to center on
* Zoom level

# Phase 2

Add weather information with the following abstracted:

* API key
* Temperature type (C/F)
* Zip code for temperature check
* Show now and forecast

# Phase 3

Augment and expand test coverage.
