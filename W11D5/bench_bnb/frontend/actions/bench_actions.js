import * as ApiUtil from '../util/bench_api_util';

export const RECEIVE_BENCHES = 'RECEIVE_BENCHES';

const receiveBenches = (benches) => ({
  type: RECEIVE_BENCHES,
  benches
});

export const fetchBenches = () => dispatch => (
  ApiUtil.fetchBenches()
    .then( benches => {
      return dispatch(receiveBenches(benches));
    })
    .fail( response => {
      const errors = response.responseJSON;
      return dispatch(receiveErrors(errors));
    })
);