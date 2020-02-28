import { createStore, applyMiddleware } from "redux";
import rootReducer  from "../reducers/root_reducer";
import thunk from 'redux-thunk';
import logger from 'redux-logger';
import { usersReducer } from "../reducers/users_reducer";
import entitiesReducer from "../reducers/entities_reducer";
import sessionErrorsReducer from "../reducers/session_errors_reducer";
import errorsReducers from "../reducers/errors_reducer";
import { sessionReducer } from "../reducers/session_reducer";

export default (preloadedState = {}) => {
    return createStore(rootReducer, preloadedState, applyMiddleware(thunk, logger))
}