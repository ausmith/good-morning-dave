good-morning-dave
=================

One stop shop for what you need to know for your work-day.

I have stopped development on this project now that I have Google Now
on my phone.

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

# Phases

## Phase 0

Embed a map with custom params on a web page with the traffic layer.

## Phase 1

Abstract the map so that we have db fields that fill in things like:

* API key
* Address to center on
* Zoom level

## Phase 2

Add weather information with the following abstracted:

* API key
* Temperature type (C/F)
* Zip code for temperature check
* Show now and forecast

## Phase 3

Augment and expand test coverage.

# How Plugins Work

Plugins are as simple as dropping a new partial view into the welcome directory
and then adding the appropriate `render` to the welcome index. Not complicated,
but still requiring some manual work as of now. If the plugin includes ruby
code, test it. With the google maps plugin, it is reacing out to the google
servers for the javascript file(s), so it is wrapped in a
`if not Rails.env.test?` so that it doesn't try to do that in test code. As of
now, there are now there are no other tests sfor the view code beyond "does it
work."
