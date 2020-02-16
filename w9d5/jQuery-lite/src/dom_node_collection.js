export default class DOMNodeCollection{
  constructor(arr){
    this.HTMLElements = arr;
  }


  html(str){

    // Array.from(document.getElementsByTagName('li')).forEach(el =>{
    //   debugger;
    //   el.innerHTML = "pizza";
    // });

    if (str){
      this.HTMLElements.forEach(el => {
        el.innerHTML = str;
      })
    }else {
      return this.HTMLElements[0].innerHTML;
      }
  }
  



  empty(){
    this.HTMLElements.forEach(el=>{
      el.innerHTML="";
    })
  }

  append(arg){
      this.HTMLElements.forEach(el=>{
        if(arg instanceof HTMLElement) el.innerHTML = arg.outerHTML; //html element
        if(typeof arg ==="string"){ //if arg is a string  <p>this is a appended string</p>
          el.innerHTML = arg; 
          // '<img src = "www.youtube.com">'
        }
        if(arg instanceof DOMNodeCollection){
          this.HTMLElements.forEach(el=>{
            let allOuterHtml = "";
            arg.HTMLElements.forEach(newEl => {
              allOuterHtml+=newEl.outerHTML;
            });
            el.innerHTML = allOuterHtml; 
          });
        }

      });
      
  }
}

