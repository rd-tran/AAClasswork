import React from 'react';
import { Route, Switch, Redirect } from 'react-router-dom';
import { AuthRoute, ProtectedRoute } from '../util/route_utils'
import GreetingContainer from "./greeting/greeting_container";
import LoginFormContainer from './session/login_form_container';
import SignupFormContainer from './session/signup_form_container';
import SearchContainer from './search/search_container';

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />
    </header>

    <Switch>
      <Route exact path="/" component={SearchContainer} />
      <AuthRoute exact={true} path="/login" component={LoginFormContainer} />
      <AuthRoute exact={true} path="/signup" component={SignupFormContainer} />
      <Redirect to="/" />
    </Switch>
  </div>
);


export default App;