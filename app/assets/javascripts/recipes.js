$(window).ready(function(){

  $(".show-all-recipes").on("click", function(){
    $(".recipe-list .recipe").show("slow");
  })

  $(".breakfast-only").on("click", function(){

    $(".recipe-list .recipe").hide("slow");
    $(".recipe-list .breakfast").show("slow");
  })

  $(".tacos-only").on("click", function(){

    $(".recipe-list .recipe").hide("slow");
    $(".recipe-list .tacos").show("slow");
  })

})
