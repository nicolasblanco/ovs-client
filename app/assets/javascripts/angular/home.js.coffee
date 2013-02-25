app_module = angular.module 'home_app', ['ovs_event_resource']

app_module.controller "EventCtrl", ["$scope", "Event", ($scope, Event) ->
  $scope.current_date = window.currentDate

  $scope.reloadEvents = ->
    $scope.events = Event.query { date: $scope.current_date.format("YYYY-MM-DD") }

  $scope.setCurrent = (index) ->
    $scope.current_event = $scope.events[index]

  $scope.nextDay = ->
    window.currentDate.add("days", 1)
    $scope.reloadEvents()

  $scope.currentDateFormatted = ->
    $scope.current_date.format("DD/MM/YYYY")

  $scope.previousDay = ->
    window.currentDate.add("days", -1)
    $scope.reloadEvents()

  $scope.reloadEvents()
]

# app_module = angular.module 'pgep_program_form', ['ui', 'pgep_select_styled', 'pgep_format_resource', 'pgep_genre_resource', 'pgep_country_resource', 'pgep_award_resource', 'pgep_collection_item_resource', 'pgep_theme_resource', 'pgep_cast_role_resource']

# app_module.directive 'selectStyledPersonAjax', ["$parse", ($parse) ->
#   restrict: "A"
#   link: (scope, element, attr) ->
#     parsed = $parse(attr.selectStyledPersonAjax)

#     element.select2
#       minimumInputLength: 3
#       ajax:
#         url: "/admin/people.json"
#         dataType: "json"
#         data: (term, page) ->
#           { q: term }
#         results: (data, page) ->
#           { results: data, more: false }

#     element.on "change", ->
#       scope.$apply ->
#         parsed.assign(scope, element.val())
# ]

# app_module.controller "FormatCtrl", ["$scope", "Format", "Genre", ($scope, Format, Genre) ->
#   $scope.formats   = Format.query ->
#     $scope.format_id = window.angular_init.format_id

#     if $scope.format_id
#       $scope.genres = Genre.query { format_id: $scope.format_id }, ->
#         $scope.genre_id = window.angular_init.genre_id

#   $scope.reloadGenres = ->
#     $scope.genres = Genre.query { format_id: $scope.format_id }]

# app_module.controller "CountryCtrl", ["$scope", "Country", ($scope, Country) ->
#   $scope.countries = Country.query ->
#     $scope.country_id = window.angular_init.country_id]

# app_module.controller "AwardCtrl", ["$scope", "Award", ($scope, Award) ->
#   $scope.awards = Award.query()
#   $scope.program_awards = window.angular_init.award_ids

#   $scope.add = ->
#     $scope.program_awards.push({})

#   $scope.remove = (index) ->
#     $scope.program_awards[index].deleted = true]

# app_module.controller "CollectionItemCtrl", ["$scope", "CollectionItem", ($scope, CollectionItem) ->
#   $scope.collection_items = CollectionItem.query()
#   $scope.program_collection_items = window.angular_init.collection_item_ids

#   $scope.add = ->
#     $scope.program_collection_items.push({})

#   $scope.remove = (index) ->
#     $scope.program_collection_items[index].deleted = true
# ]

# app_module.controller "ThemeCtrl", ["$scope", "Theme", ($scope, Theme) ->
#   $scope.themes = Theme.query ->
#     $scope.themes = _.map $scope.themes, (theme) ->
#       { _id: theme._id, name: theme.name, selected: _.contains(window.angular_init.theme_ids, theme._id) }
# ]

# app_module.controller "CastCtrl", ["$scope", "CastRole", ($scope, CastRole) ->
#   $scope.current_program_cast_roles = window.angular_init.cast_role_ids

#   $scope.program_casts = []

#   $scope.add = ->
#     $scope.program_casts.push({})
#     last_person = $scope.program_casts[$scope.program_casts.length - 1]
#     $scope.$watch "program_casts[#{$scope.program_casts.length - 1}]._id", (v) ->
#       last_person.cast_roles = CastRole.query { person_id: v }

#   $scope.remove = (index) ->
#     $scope.program_casts[index].deleted = true

#   $scope.removeCurrent = (index) ->
#     $scope.current_program_cast_roles[index].deleted = true
# ]
