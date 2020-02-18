
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    let children = htmlElement.children
    if (Array.from(children).length !== 0){
        htmlElement.innerHTML = '';    }
    let el = document.createElement("p");
    el.innerHTML = string;
    htmlElement.appendChild(el)
};

htmlGenerator('Party Time.', partyHeader);

// const pTag = document.createElement("p");
// pTag.innerHTML = string;
// htmlElement.appendChild(pTag);