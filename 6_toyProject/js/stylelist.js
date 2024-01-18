$(function(){
    $(".style-item").slice(0, 7).show();

    $(".style-next").click(function(){
        $(".style-item:visible:first").hide();
        $(".style-item:hidden:last").show();
    });

    $(".style-prev").click(function(){
        $(".style-item:visible:last").hide();
        $(".style-item:hidden:first").show();
    });
});
