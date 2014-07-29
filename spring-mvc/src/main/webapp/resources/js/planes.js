
$( document ).ready(function() {
	$( "#startGame" ).click(function() {
		$("#gameDiv").load("/smvc/planes/playGame")
	});
});