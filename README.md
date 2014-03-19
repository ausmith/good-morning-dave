good-morning-dave
=================

One stop shop for what you need to know for your work-day

# Goals

Provide an interface for getting morning alerts about:

* Traffic conditions for the input commute
* Weather for the day

## Possible Future Enhancements

* Sync with calendar for the day
  * Adjust time of notification time according to meeting schedule
* Adjust notification time according to commute time

## "Too Soon to Discuss" Enhancements

* Auth with github
* Persistent DB instead of config files

# Phase 0

Focus on getting things working as a command line tool. Shall interface
with Google Maps API for commute data and Weather Underground for forecast
data. Include integration tests from end to end with mocks.

# Phase 1

Add deployment steps so it can run automatically (initially may be as easy
as a cron job). Begin turning into a simple Rails app so the information
can be alternatively displayed in a web browser.

# Phase 2

Get here and then we can talk.
