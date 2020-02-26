const thunk = state => next => action => {
    if (typeof action === "function"){
        action(state.dispatch);
    } else {
        next(action);
    }
};

export default thunk;