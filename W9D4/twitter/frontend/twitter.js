const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');

$(function () {
  $('button.follow-toggle').each( (i, button) => new FollowToggle(button) );
  $('nav.users-search').each( (i, search) => new UsersSearch(search) );
});
