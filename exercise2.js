function sum(strParse)
{  
    let array = strParse.split(',');
    let sum = 0;
    array.forEach(arr => {
        sum += parseInt(arr);
    })
    return sum;
}
let str1 = "10,20,30,40,100,200" ;
let str2 = "20,40,50,70,100";
let sum1 = sum(str1);
let sum2 = sum(str2);
    console.log(str1);
    console.log(str2);
    console.log(sum1);
    console.log(sum2);
