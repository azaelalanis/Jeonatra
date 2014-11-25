
$(document).ready(function () {
  setInterval(function() {
    var player1_score = $("#player1").html();
    var player2_score = $("#player2").html();
    var player3_score = $("#player3").html();

    var game_id = location.pathname.split("/")[2];

    $.ajax({
      type: "POST",
      url: "/game/"+game_id+"/update",
      data: "player1=" + player1_score + "&player2=" + player2_score + "&player3=" + player3_score,
      success: function(msg){
        alert( "Data Saved: " + msg );
      }
    });
  }, 30000);
});

var selected_player = 1;

function displayOverlay(text) {
  $("<div class='overlay'>" + text + "</div>").appendTo("body");
}

function removeOverlay() {
    $(".overlay").remove();
}

function show(question,value){
  var answer = $(question).siblings().first().html();
  var questiont = $(question).html();

  var overlay = "<h3>" + questiont + "</h3> \
  <a href='#' onclick='showAnswer()'>Respuesta</a> | \
  <a href='#' onclick='removeOverlay()'>Regresar</a><br><br><br> \
  <div id='answer' class='hide'> \
  <h3>" + answer +"</h3> \
  <br /> \
  <a href='#' onclick='agregar(" + value + ", \"" + question + "\")'>Correcto</a> | \
  <a href='#' onclick='substract(" + value + ", \"" + question + "\")'>Incorrecto</a> \
  </div>"

  displayOverlay(overlay);
}

function showAnswer(){
  $("#answer").show();
}

function agregar(valor, question){
  var player = current_player();

  var current_value = parseInt(player.html());

  player.html(current_value + parseInt(valor));

  $(question).parent().parent().attr("onclick", '').unbind('click');
  $(question).parent().parent().html("");
  removeOverlay();
}

function substract(valor, question){
  var player = current_player();

  var current_value = parseInt(player.html());

  player.html(current_value - parseInt(valor));


  $(question).parent().parent().attr("onclick",'').unbind('click');
  $(question).parent().parent().html("");
  removeOverlay();
}

function setplayer(valor){
  selected_player = valor;

  $("#player1-btn").css("background-color","#DDD");
  $("#player2-btn").css("background-color","#DDD");
  $("#player3-btn").css("background-color","#DDD");

  var selector = "#player" + valor + "-btn";
  $(selector).css("background-color","yellow");
}

function current_player(){
  if (selected_player == 1) {
    return $("#player1");
  }

  if (selected_player == 2) {
    return $("#player2");
  }

  if (selected_player == 3) {
    return $("#player3");
  }
}
