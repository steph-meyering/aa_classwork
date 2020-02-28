import { RECEIVE_CURRENT_USER } from '../actions/sessions_actions'
export const usersReducer = (state = {}, action) => {

    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            return Object.assign({}, state, { [action.user.id]: action.user })
    
        default:
            return state;
    }
}
