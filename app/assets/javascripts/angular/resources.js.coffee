angular.module('ovs_event_resource', ['ngResource']).
factory 'Event', ["$resource", ($resource) ->
  Event = $resource "#{window.apiHost}/events/:id", format: 'json']
