angular.module('ovs_event_resource', ['ngResource']).
factory 'Event', ["$resource", ($resource) ->
  Event = $resource 'http://ovs-api.herokuapp.com/events/:id', format: 'json']
