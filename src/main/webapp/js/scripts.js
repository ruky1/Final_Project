/*!
* Start Bootstrap - Shop Homepage v5.0.6 (https://startbootstrap.com/template/shop-homepage)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-homepage/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

//header slider
$("#carouselExampleControls").carousel();

/*	HC's_js	--	start	*/
function listShow() {
	document.getElementById("addrType").style.display = "none";
	document.getElementById("listType").style.display = "block";
	document.getElementById("cardType").style.display = "none";
	document.getElementById("pageList").style.display = "";
	document.getElementById("pageList").style.display = "block";
	}
function cardShow() {
	document.getElementById("addrType").style.display = "none";
	document.getElementById("listType").style.display = "none";
	document.getElementById("cardType").style.display = "";
	document.getElementById("pageList").style.display = "";
	
	}
	
function addrShow() {
	document.getElementById("addrType").style.display = "block";
	document.getElementById("listType").style.display = "none";
	document.getElementById("cardType").style.display = "none";
 	document.getElementById("pageList").style.display = "none";
} 
/*	HC's_js	--	end	*/