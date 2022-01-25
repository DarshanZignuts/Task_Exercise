// Button with id myBtn
let myBtn = document.getElementById("myBtn");

// div with id content 
let conn = document.getElementById("conn");

async function postData(){
    try {
        console.log('im inside')
        url = "https://api.github.com/users";
        data = '{"name":"harglry347485945","salary":"123","age":"23"}'
        const resp = await fetch(url);
        console.log("resp ::; ", resp);
        var da1 = await resp.json();
        console.log(da1);
    } catch(err) {
        console.log("err ::: ", err);
    }
    
}

postData();