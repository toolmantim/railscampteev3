$(function() {
  var sex, size, name;

  $("h1.order").click(function() {
    $("p.days, p.intro, h1.order").fadeOut(300);
    $(".guy-or-gal").animate({bottom:"-150px"}, 500);
  });
  
  $(".guy-or-gal h1.gal").click(function() {
    sex = "Gals";
    $(".tee").animate({width:"325px",height:"240px"});
    $(".guy-or-gal").find(".guy, .or, .question").animate({opacity:0}, function() {$(this).hide();});
    $(".guy-or-gal h1.gal").animate({top:"-100px",left:"-50px"});

    $(".gal-tee-sizes").css({display:"block"}).animate({opacity:1});
    $(".gal-tee-sizes .small").animate({left:"0px"});
    $(".gal-tee-sizes .medium").animate({left:"105px"});
    $(".gal-tee-sizes .large").animate({left:"230px"});
    $(".gal-tee-sizes .x-large").animate({left:"380px"});
  });

  $(".guy-or-gal h1.guy").click(function() {
    sex = "Guys";
    $(".tee").animate({width:"325px",height:"240px"});
    $(".guy-or-gal").find(".gal, .or, .question").animate({opacity:0}, function() {$(this).hide();});
    $(".guy-or-gal h1.guy").animate({top:"-100px",left:"-50px"});

    $(".guy-tee-sizes").css({display:"block"}).animate({opacity:1});
    $(".guy-tee-sizes .small").animate({left:"0px"});
    $(".guy-tee-sizes .medium").animate({left:"105px"});
    $(".guy-tee-sizes .large").animate({left:"230px"});
    $(".guy-tee-sizes .x-large").animate({left:"380px"});
  });

  $(".guy-tee-sizes div, .gal-tee-sizes div").click(function() {
    size = $(this).text();
    $(this).animate({left:"400px"});
    $(this).siblings("*").fadeOut();
    $(".guy-or-gal").animate({opacity:0}, function() {$(this).css({display:"none"})});
    $(".details").css({display:"block"}).animate({opacity:1}, function() {
      $(".details input.name").focus();
    });
  });
  
  $(".details form").submit(function(e) {
    name = $(".details form input.name").val();
    if (!name.match(/\w+/)) return false;
    $(".details").fadeOut();
    $(".pay h1 span.name").text(name.split(" ")[0]);
    Cufon.replace(".pay h1");
    $(".guy-tee-sizes div:visible, .gal-tee-sizes div:visible").animate({left:"0px"});
    $(".pay").css({display:"block"}).animate({opacity:1});
    $(".pay h1").text("Railscamp Tee for " + name + " - " + sex + " " + size);
    $(".pay form input.details").val("Railscamp tee - " + name + " - " + size + " - " + sex);
    e.preventDefault();
  });
});