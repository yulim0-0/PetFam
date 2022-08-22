/**
 * 
 */
 
 var setCookie = function(name, value, exp) {
    var date = new Date();
    date.setTime(date.getTime() + exp*24*60*60);
    document.cookie = name + '=' + value ;

};