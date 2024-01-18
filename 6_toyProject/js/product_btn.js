$(function(){
    $(".product_item").slice(0, 5).show(); // 초기갯수

    $(".btn_product a").click(function(e){ // 클릭시 more
        e.preventDefault();
        $(".product_item:hidden").slice(0, 5).show(); // 클릭시 more 갯수 지정

        if($(".product_item:hidden").length == 0){ // 컨텐츠 남아있는지 확인
            $(".btn_product a").hide();
        }
    });
});