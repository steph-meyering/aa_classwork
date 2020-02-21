const allTodos = (state) => {
    Object.keys(state.todos).map((i) =>{
        return state.todos[i]
    })
}

export default allTodos