import { connect } from 'react-redux';
import { signup } from '../../actions/session_actions';
import SessionForm from './session_form';

const mapStateToProps = (state, ownProps) => ({
  loggedIn: Boolean(state.session.id),
  formType: 'signup',
  errors: state.errors.session
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: (user) => dispatch( signup(user) )
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);