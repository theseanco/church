/*

Sound Script!!!

BEGINNING

Choral piece & Slow Pulse, quite heavy

--Choral piece ends

Pulse gets really quiet, but speeds from 50 to 65 bpm

Brings in street level sounds (now edited), but not the bird

A tiny bit of orange brings in the narrative, fade out the street sound

orange goes on for a bit

orange fades out, to pulse

Crabs come in at the line 'and creatures began to stir' - Pulse continues to grow

When charlie steps out of the boat with the crabs, shepherd tone - Pulse continues to grow

Then it all cuts at the same point, for the line about rebuilding bricks made of sand etc

Then shepherd tone upwards & strobe which peters out into thunder - Pulse still very strong

This then makes room for the bird and the guitar - Pulse peters out at 55bpm

Then the choral piece comes back in which is cut short by the control mechanism.


*/

/*
CHORAL THING
*/

s.makeWindow
(
~fund = 41.2;
~pulsemaster = {Impulse.kr(50/60)};
~pulse2 = {EnvGen.ar(Env.perc(0.3,0.2),~pulsemaster.kr)};
~heartbeat = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,0.2/*Line.kr(0,0.1,20)*/).flat*~pulse2.ar};
~heartbeat.play;
)

//Pulse gets really quiet
(
~pulse = {SinOsc.kr(1).range(15000,15001)};
~pulsemaster = {Impulse.kr(65/60)};
//~pulse2 = {EnvGen.ar(Env.perc(0.3,0.2),~pulsemaster.kr)};
//~heartbeat = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,0.1/*Line.kr(0,0.1,20)*/).flat*~pulse2.ar};
//~heartbeat.play;
//street sounds
~rec = {Pan2.ar(LPF.ar(PlayBuf.ar(1,d["Recordings"][12],1,1,0,1)*0.5,~pulse,*Line.kr(0,0.8,10)))};
~rec.play;
)




//orange comes in, after monologue about drugs
(
//
//RED
b.sendMsg("/l1r/",255);
//GREEN
Task({var light = 110;
	75.do({
		b.sendMsg("/l1g/",light);
		light = light - 1;
		light.postln;
		0.3.wait;
})}).start;
//BLUE
b.sendMsg("/l1b/",0);
b.sendMsg("/l1m/",255);
//
~dfm = {DFM1.ar(Splay.ar(Pulse.ar([~fund,~fund*4,~fund*8,~fund*9,~fund*LFNoise1.kr(LFNoise1.kr(0.1).range(0.01,1)).range(1,16).round(2)],SinOsc.kr(0.1).range(0.1,0.9),[LFNoise1.kr(0.4).range(0,0.2),LFNoise1.kr(0.4).range(0,0.2),LFNoise1.kr(0.4).range(0,0.2),LFNoise1.kr(0.4).range(0,0.15),LFNoise1.kr(0.4).range(0,0.15)])),~fund*10,LFNoise1.kr(0.1).range(0.01,0.1),1,0,mul:Line.kr(0,0.2,20))};
~rec.stop(20);
~dfm.play;
)


//orange fades out just to leave the pulse, this happens when the text is in the church
~dfm.stop(10)

//crabs come in, pulse grows
(
~crabs = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],1,1,0,1,0),~pulse)*Line.kr(0,0.01,10)};
~crabs2 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.7,1,0,1,0),~pulse,2)*Line.kr(0,0.01,10)};
~crabs3 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.4,1,0,1,0),~pulse,2)*Line.kr(0,0.01,10)};
~crabs4 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.1,1,0,1,0),~pulse,2)*Line.kr(0,0.01,10)};
~crabs.play;
~crabs2.play;
~crabs3.play;
~crabs4.play;
)

//pulse gets louder
~heartbeat.vol = 1.2

//mock control
~pulse = {SinOsc.kr(1).range(Line.kr(9000,9,30),9000)}

//descent shepherd tone - sink down
(
//LIGHTS
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


~shep = {     var intervals, amps; #intervals, amps = Shepard.kr(5,-0.01);(SinOsc.ar( (intervals + 50).midicps,0,Line.kr(0,1,1)) * amps).sum * 0.02 !2};
~crabs = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],1,1,0,1,0),~pulse)*Line.kr(0.01,0.05,10)};
~crabs2 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.7,1,0,1,0),~pulse,2)*Line.kr(0.01,0.05,10)};
~crabs3 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.4,1,0,1,0),~pulse,2)*Line.kr(0.01,0.05,10)};
~crabs4 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.1,1,0,1,0),~pulse,2)*Line.kr(0.01,0.05,10)};
~shep.play;
)

//NEEDS BLACKOUT

//HARD STOP - needs volume changing all over the place
(
b.sendMsg("/l1r/",0);
b.sendMsg("/l1g/",0);
b.sendMsg("/l1b/",0);
b.sendMsg("/l1m/",0);
Server.freeAll
)

//Task, added automatic strobe control
(
Task({
	~pulsemaster = {Impulse.kr(65/60)};
	~pulse2 = {EnvGen.ar(Env.perc(0.3,0.2),~pulsemaster.kr)};
	~heartbeat = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,0.2/*Line.kr(0,0.1,20)*/).flat*~pulse2.ar};
	~heartbeat.play;
	b.sendMsg("/strobeBrightness",255);
	Task({var light = 0;
	255.do({
		b.sendMsg("/strobeSpeed",light);
		light = light + 1;
		light.postln;
		0.196.wait;
})}).start;
	~shep = {     var intervals, amps; #intervals,
		amps = Shepard.kr(5,XLine.kr(0.01,110,45));BLowShelf.ar(LPF.ar(BHiShelf.ar(((Saw.ar( (intervals + 80).midicps,Line.kr(0,1,1)) * amps).sum * 0.05 !2),3000,1,10),Line.kr(500,19000,60)),300,1,7)};
	~shep.play;
	50.wait;
	{LPF.ar(LeakDC.ar(GVerb.ar(EnvGen.ar(Env.perc(0,0.1),1,8,0,1,0),300,30,0.5,0.5,15,0.1,1,0.9,300,5)),9000)*XLine.kr(0.0001,0.4,2)}.play;
	~shep.stop(2);
	1.wait;
	b.sendMsg("/strobeBrightness",0);
	b.sendMsg("/strobeSpeed",0);
	2.wait;
	~heartbeat.vol = 0.3;
	~pulsemaster = {Impulse.kr(50/60)};
	//pulse also needs to be quieter
	15.wait;
		//it's possible this will be just streetlights will be house at DC
	Task({var light = 0;
	255.do({
		b.sendMsg("/l1r/",light);
		light = light + 1;
		light.postln;
		0.03.wait;
})}).start;
	Task({var light = 0;
	110.do({
		b.sendMsg("/l1g/",light);
		light = light + 1;
		light.postln;
		0.1.wait;
})}).start;
	b.sendMsg("/l1b/",0);
	b.sendMsg("/l1m/",255);
	~rec = {Pan2.ar(FreeVerb.ar(PlayBuf.ar(1,d["Recordings"][1],1,1,0,1),0.33,0.7)*Line.kr(0.1,1,2))};
	~rec2 = {Pan2.ar(FreeVerb.ar(PlayBuf.ar(1,d["Recordings"][0],1,1,0,1),0.33,0.7)*XLine.kr(0.0001,0.7,5))};
	~rec.play;
	~rec2.play;
}).start;
)

(
~rec.stop(20);
~rec2.stop(20);
~heartbeat.stop(10);
)

//CHORUS AND CONTROL

//bird and guitar fade out in advance of the choral piece coming in
