import { combineReducers } from "redux";
import sessionErrorsReducer from "./session_errors_reducer";

const errorsReducers = combineReducers({
    errors: sessionErrorsReducer
})

export default errorsReducers;
