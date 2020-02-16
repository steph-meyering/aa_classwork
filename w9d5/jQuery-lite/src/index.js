import DOMNodeCollection from './dom_node_collection.js';


window.$l = function(arg){
  // debugger;
  if(arg instanceof HTMLElement){
    // debugger;
    return new DOMNodeCollection([arg]); //this is just html element
  }else if(typeof arg === "string"){
    return new DOMNodeCollection(Array.from(document.querySelectorAll(arg)));
  }
}

window.liEles = document.querySelectorAll('li');
window.dnc = new DOMNodeCollection(liEles);


