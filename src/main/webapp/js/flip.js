console.log('hello')


		
		function openRegister() {
			console.log("openRegister");
			var card = document.getElementById("card");
			card.style.transform = "rotateY(-180deg)";
		}
		function openLogin() {
			console.log("openLogin");
			var card = document.getElementById("card");
			card.style.transform = "rotateY(0deg)";
		}
		
		function backToRegister() {
			console.log("backToRegister");
			var card = document.getElementById("card");
			card.style.transform = "rotateY(-180deg)";
			
		}


