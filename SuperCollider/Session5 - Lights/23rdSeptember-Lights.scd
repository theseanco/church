//lights for CHURCH

//yellow street level, through to orange in the church
(
b.sendMsg("/strobeBrightness",0);
b.sendMsg("/strobeSpeed",0);
b.sendMsg("/l1r/",255);
b.sendMsg("/l1g/",110);
b.sendMsg("/l1b/",0);
b.sendMsg("/l1m/",255);
)


//orange in the church
(
//RED
b.sendMsg("/l1r/",255);
//GREEN
Task({var light = 110;
	75.do({
		b.sendMsg("/l1g/",light);
		light = light - 1;
		light.postln;
		0.03.wait;
})}).start;
//BLUE
b.sendMsg("/l1b/",0);
b.sendMsg("/l1m/",255);
)

//Through the tomb into the cave
(
//RED
Task({var light = 255;
	110.do({
		b.sendMsg("/l1r/",light);
		light = light - 1;
		light.postln;
		0.27.wait;
})}).start;
//green
Task({var light = 35;
	35.do({
		b.sendMsg("/l1g/",light);
		light = light - 1;
		light.postln;
		0.85.wait;
})}).start;
//BLUE
Task({var light = 0;
	255.do({
		b.sendMsg("/l1b/",light);
		light = light + 1;
		light.postln;
		0.11.wait;
})}).start;
//master
b.sendMsg("/l1m/",255);
)

//blue is when we sink
(
Task({var light = 145;
	145.do({
		b.sendMsg("/l1r/",light);
		light = light - 1;
		light.postln;
		0.137.wait;
})}).start;
b.sendMsg("/l1g/",0);
b.sendMsg("/l1b/",255);
b.sendMsg("/l1m/",255);
)

//The blackout
//yellow street level, through to orange in the church
(
b.sendMsg("/l1r/",0);
b.sendMsg("/l1g/",0);
b.sendMsg("/l1b/",0);
b.sendMsg("/l1m/",0);
Server.freeAll
)














//strobe testing
b.sendMsg("/strobeBrightness",255);
b.sendMsg("/strobeSpeed",255);