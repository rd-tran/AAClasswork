const APIUtil = require('./api_util')

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = $('input.user-search-input');
    this.$ul = $('ul.users');

    this.handleInput(this);
  }

  handleInput(search) {
    search.$input.on('input', () => {
      if (search.$input.val() === '') {
        search.renderResults([]);
        return;
      }

      APIUtil.searchUsers(search.$input.val())
        .then( users => search.renderResults(users) );
    });
  }

  renderResults(users) {
    this.$ul.empty();

    for (let i = 0; i < users.length; i++) {
      const user = users[i];

      let $a = $('<a>');
      $a.text(`${user.username}`);
      $a.attr('href', `users/${user.id}`);

      let $li = $('<li>');
      $li.append($a);
      this.$ul.append($li);
    }
  }
}

module.exports = UsersSearch;