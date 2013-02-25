angular.module('ovs_event_resource', ['ngResource']).
factory 'Event', ["$resource", ($resource) ->
  Event = $resource 'http://www.dev.localhost.com\\:3001/events/:id', format: 'json']
