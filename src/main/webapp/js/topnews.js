var CurrentHotScreen = 0 ;
var hot_query_td =  document.getElementById('hotsearchlist');
function setHotQueryList(screen){
	var Vmotion = "forward" ;
	var MaxScreen = 7 ;
	if(screen >= MaxScreen){
		screen = 0 ;
		Vmotion = "reverse" ;
	}
	cleanallstyle();
	document.getElementById("focus_"+screen).className = "up" ;
	if(null!=hot_query_td.filters){
		hot_query_td.filters[0].apply();
		hot_query_td.filters[0].motion = Vmotion;
	}
	for(i=0;i<MaxScreen;i++){
		document.getElementById("switch_"+i).style.display = "none" ;
	}
	document.getElementById("switch_"+screen).style.display = "block" ;
	if(null!=hot_query_td.filters){
		hot_query_td.filters[0].play();
	}
	CurrentHotScreen = screen ;
}

function refreshHotQuery(){
	refreshHotQueryTimer = null;
	setHotQueryList(CurrentHotScreen+1);
	refreshHotQueryTimer = setTimeout('refreshHotQuery();', 5000);
}



function cleanallstyle(){
	for(i=0;i<7;i++){
		document.getElementById("focus_"+i).className = "" ;
	}
}

function show_focus_image(index){
	clearTimeout(refreshHotQueryTimer);
	setHotQueryList(index);
	refreshHotQueryTimer = setTimeout('refreshHotQuery();', 5000);
}

var refreshHotQueryTimer = null ;

setHotQueryList(CurrentHotScreen);
refreshHotQueryTimer = setTimeout('refreshHotQuery();', 5000);