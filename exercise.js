var mergeOne = (array1,array2) => {
    return array1.concat(...array2);   
}
let mergeTwo = (array1,array2) => {
    return [].concat(array1,array2);
}
let mergeThree = (array1,array2) => {
    return [...array1,...array2];
}
let mergeFour = (array1,array2) => {
    return array1.push(...array2);
}
let mergeFive = (array1,array2) => {
    array2.forEach(arra => {
        array1[array1.length]= arra;
    });
    return array1;
}
var arr1 = ["one", "two", "three"];
var arr2 = ["four", "five", "six"];
var arr = ["one", "two", "three"];
console.log(mergeOne(arr1,arr2));
console.log(mergeTwo(arr1,arr2));
console.log(mergeThree(arr1,arr2));
console.log(mergeFour(arr1,arr2));// it only show length because array merge in arr
console.log(arr1);
console.log(mergeFive(arr,arr2));
