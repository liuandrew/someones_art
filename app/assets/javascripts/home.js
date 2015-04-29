
$(document).ready(function(){
	imageAnimator.pauseImageAnimation();
	$("#stills").hover(imageAnimator.resumeImageAnimation, imageAnimator.pauseImageAnimation);
});

var imageAnimator = (function(){
	var numImages = 3;
	var currentImage = 1;
	var anim;
	var frame = 1;
	var maxFrames = 100;
	var x;
	var y;
	var initiated = false;
	var $imgContainer = $("#homepage-stills-container");

	function randomDirection() {
		//returns a random angle 0-360 degrees
		return Math.random() * 2 * Math.PI;
	}

	//gets a random direction of movement
	//resets container position and unhides image before initiating animation
	function callNextAnimation() {
		var direction = randomDirection();
		x = Math.cos(direction) * (3/50);
		y = Math.sin(direction) * (3/50);
		frame = 1;

		$img = $("#stills-" + currentImage);
		$imgContainer.css("right", "0");
		$imgContainer.css("top", "0");

		$img.toggleClass("hidden");
		anim = setInterval(setAnimationInterval, 20);
	}

	//function for setInterval, controls container movement and opacity of img
	//hides image again after end of animation
	function setAnimationInterval() {
		$imgContainer.css("right", frame*x + "em");
			$imgContainer.css("top", frame*y + "em");
			if(frame <= (maxFrames/2)) {
				$img.css("opacity", "" + frame/(maxFrames/2));
			} else if(frame > (maxFrames/2)) {
				$img.css("opacity", "" + (1-(frame-(maxFrames/2))/(maxFrames/2)));
			}

			frame++;
			if(frame > maxFrames) {
				$img.toggleClass("hidden");
				clearInterval(anim);
				nextImage();
				callNextAnimation();
		}
	}

	//pause animation
	function pauseAnimation() {
		clearInterval(anim);
	}

	//resume or initate animation if first load on page
	function resumeAnimation() {
		if(initiated) {
			anim = setInterval(setAnimationInterval, 20);
		} else {
			callNextAnimation();
			initiated = true;
		}
	}

	//increments image so that animation cycles
	function nextImage() {
		currentImage++;
		if(currentImage > numImages) {
			currentImage = 1;
		}
	}

	//functions for user control (pause for hover out, resume for hover in)
	return {
		pauseImageAnimation: function() {
			pauseAnimation();
		},

		resumeImageAnimation: function() {
			resumeAnimation();
		}
	}

})();