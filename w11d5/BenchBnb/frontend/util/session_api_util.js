
// export const signup = formUser => {
//     console.log(formUser, 'form User');
//     console.log({ user: { formUser } });
//     return ($.ajax({
//         url: "/api/users",
//         method: "POST",
//         data: {
//             user: formUser
//         }
//     }));
// }


export const postUser = user => {
    return ($.ajax({
        url: "/api/users",
        method: "POST",
        data: { user }
    }));
}

export const postSession = user => { 
    console.log(user)
    return $.ajax({
    url: "/api/session",
    method: "POST",
    data: { user }
})}

export const deleteSession = () => $.ajax({
    url: "/api/session",
    method: "DELETE"
})

