$(function (){

    var valueElement = $('#value');
    function incrementValue(e){
        valueElement.text(Math.max(parseInt(valueElement.text()) + e.data.increment, 0));
        return false;
    }

    $('.pulsebutton').one('mouseenter', {increment: 1}, incrementValue);

});


