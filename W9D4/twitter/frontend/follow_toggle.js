const APIUtil = require('./api_util')

class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state');
    
    this.render();
    this.handleClick(this);
  }

  handleClick(button) {
    button.$el.on('click', () => {
      event.preventDefault();

      if (button.followState === 'followed') {
        button.followState = 'unfollowing';
        button.render();

        APIUtil.unfollowUser(button.userId).then( () => {
          button.followState = 'unfollowed';
          button.render();
        });
      } else if (button.followState === 'unfollowed') {
        button.followState = 'following';
        button.render();

        APIUtil.followUser(button.userId).then( () => {
          button.followState = 'followed';
          button.render();
        });
      }
    })
  }

  render() {
    if (this.followState === 'followed') {
      this.$el.prop('disabled', false);
      this.$el.html('Unfollow!');
    } else if (this.followState === 'unfollowing') {
      this.$el.prop('disabled', true);
      this.$el.html('Unfollowing!');
    } else if (this.followState === 'unfollowed') {
      this.$el.prop('disabled', false);
      this.$el.html('Follow!');
    } else if (this.followState === 'following') {
      this.$el.prop('disabled', true);
      this.$el.html('Following!');
    }
  }
}

module.exports = FollowToggle;