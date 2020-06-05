const APIUtil = {

  followUser: id => APIUtil.changeFollowStatus(id, 'POST'),

  unfollowUser: id => APIUtil.changeFollowStatus(id, 'DELETE'),

  changeFollowStatus: (id, method) => (
    $.ajax({
      method: method,
      url: `/users/${id}/follow`,
      dataType: 'json'
    })
  ),

  searchUsers: (queryVal) => (
    $.ajax({
      method: 'GET',
      url: "/users/search",
      dataType: 'json',
      data: { query: queryVal }
    })
  )

};

module.exports = APIUtil;