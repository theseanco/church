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
/*
CHORAL THING
*/


(
~fund = 41.2;
~pulsemaster = {Impulse.kr(50/60)};
~pulse2 = {EnvGen.ar(Env.perc(0.3,0.2),~pulsemaster.kr)};
~heartbeat = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,0.2/*Line.kr(0,0.1,20)*/).flat*~pulse2.ar};
~heartbeat.play;
)

*/

//Pulse gets really quiet
(
b.sendMsg("/strobeBrightness",0);
b.sendMsg("/strobeSpeed",0);
b.sendMsg("/l1r/",255);
b.sendMsg("/l1g/",110);
b.sendMsg("/l1b/",0);
b.sendMsg("/l1m/",255);
~fund = 41.2;
~pulsemaster = {Impulse.kr(65/60)};
~pulse2 = {EnvGen.ar(Env.perc(0.3,0.2),~pulsemaster.kr)};
~heartbeat = {arg amp = 1; SinOsc.ar([~fund,~fund],0,0.2*amp/*Line.kr(0,0.1,20)*/).flat*~pulse2.ar};
~heartbeat.play;
~pulse = {SinOsc.kr(1).range(15000,15001)};
//~pulse2 = {EnvGen.ar(Env.perc(0.3,0.2),~pulsemaster.kr)};
//~heartbeat = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,0.1/*Line.kr(0,0.1,20)*/).flat*~pulse2.ar};
//~heartbeat.play;
//street sounds
~rec = {Pan2.ar(LPF.ar(PlayBuf.ar(1,d["Recordings"][12],Line.kr(0,1,20).round(1),1,0,1)*0.5,~pulse,*XLine.kr(0.000000001,0.8,20)))};
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

//as soon as the narrative starts
~heartbeat.set(\amp,0.5)


//CRAWL INSIDE TO FIND A WOODEN DOOR
(
~dfm.stop(30);
(
Task({var light = 255;
	110.do({
		b.sendMsg("/l1r/",light);
		light = light - 1;
		light.postln;
		0.27.wait;
})}).start;
Task({var light = 35;
	35.do({
		b.sendMsg("/l1g/",light);
		light = light - 1;
		light.postln;
		0.85.wait;
})}).start;
Task({var light = 0;
	255.do({
		b.sendMsg("/l1b/",light);
		light = light + 1;
		light.postln;
		0.11.wait;
})}).start;
b.sendMsg("/l1m/",255);
)
)

//crabs come in, pulse grows
//STALKED EYES PIERCE THE SURFACE OF THE WATER AROUND HIM
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

//he calls for order
~heartbeat.set(\amp,1)

//SINK DOWN THE BED PAST FISH WEED AND WRECK
(
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


~shep = {var intervals, amps; #intervals, amps = Shepard.kr(5,-0.01);(SinOsc.ar( (intervals + 50).midicps,0,Line.kr(0,1,1)) * amps).sum * Line.kr(0,0.02,10) !2};
~crabs = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],1,1,0,1,0),~pulse)*Line.kr(0.01,0.05,10)};
~crabs2 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.7,1,0,1,0),~pulse,2)*Line.kr(0.01,0.05,10)};
~crabs3 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.4,1,0,1,0),~pulse,2)*Line.kr(0.01,0.05,10)};
~crabs4 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.1,1,0,1,0),~pulse,2)*Line.kr(0.01,0.05,10)};
~shep.play;
);


//straight on
(
c.knob1.onChanged = {|val|
	OSCdef(\xdiffFilt, {|msg, filt| filt = (d[\diff1].(msg[1]))+val.linlin(0,127,3000,0); ~crabs.set(\f,filt); ~crabs2.set(\f,filt); ~crabs3.set(\f,filt); ~crabs4.set(\f,filt); },\z);
	OSCdef(\m1, {|msg| b.sendMsg("/l1m/",msg[1].linlin(-12000,12000,val.linlin(0,127,255,0),255).asInt)},\z);
	~crabs.set(\amp,val.linlin(0,127,1,3));
	~crabs2.set(\amp,val.linlin(0,127,1,3));
	~crabs3.set(\amp,val.linlin(0,127,1,3));
	~crabs4.set(\amp,val.linlin(0,127,1,3));
	val.postln;
} ;
OSCdef(\xdiffFilt, {|msg, filt| filt = d[\diff1].(msg[1])+10000; ~crabs.set(\f,filt); ~crabs2.set(\f,filt); ~crabs3.set(\f,filt); ~crabs4.set(\f,filt); },\z);
~crabs = { arg f = 2000, amp = 1; (LPF.ar(PlayBuf.ar(2,d["Recordings"][9],2,1,0,1,0),Lag.kr(f,0.6).abs)*(Line.kr(0.01,0.15,20)))*amp};
~crabs2 = { arg f = 2000, amp = 1; (LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.7,1,0,1,0),Lag.kr(f,0.6).abs,2)*(Line.kr(0.01,0.15,20)))*amp};
~crabs3 = {arg f = 2000, amp = 1; (LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.4,1,0,1,0),Lag.kr(f,0.6).abs,2)*(Line.kr(0.01,0.15,20)))*amp};
~crabs4 = {arg f = 2000, amp = 1; (LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.8,1,0,1,0),Lag.kr(f,0.6).abs,2)*(Line.kr(0.01,0.15,20)))*amp};
~crabs.play;
~crabs2.play;
~crabs3.play;
~crabs4.play;
OSCdef(\m1, {|msg| b.sendMsg("/l1m/",msg[1].linlin(-12000,12000,255,255).asInt)},\z);
);
)

OSCFunc.trace

//AND THE WALLS COLLAPSE - WHEN CHARLIE DROPS HIS ARMS
(
b.sendMsg("/l1r/",0);
b.sendMsg("/l1g/",0);
b.sendMsg("/l1b/",0);
b.sendMsg("/l1m/",0);
OSCdef(\m1, {},\z);
Server.freeAll
)

//BRICKS WE FORGOT WERE MADE OF SAND
//**PAUSE**
//THIS IS THE MUD THROUGH WHICH WE DREAM
(
Task({
	~pulsemaster = {Impulse.kr(65/60)};
	~pulse2 = {EnvGen.ar(Env.perc(0.3,0.2),~pulsemaster.kr)};
	~heartbeat = {arg amp = 1; SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,0.2*amp/*Line.kr(0,0.1,20)*/).flat*~pulse2.ar};
	~heartbeat.play;
	b.sendMsg("/strobeBrightness",255);
	Task({var light = 0;
	255.do({
		b.sendMsg("/strobeSpeed",light);
		light = light + 1;
		light.postln;
		(33/255).wait;
})}).start;
	~shep = {     var intervals, amps; #intervals,
		amps = Shepard.kr(5,XLine.kr(0.01,110,45));BLowShelf.ar(LPF.ar(BHiShelf.ar(((Saw.ar( (intervals + 80).midicps,Line.kr(0,1,1)) * amps).sum * 0.05 !2),3000,1,10),Line.kr(500,19000,35)),300,1,7)};
	~shep.play;
	35.wait;
	{LPF.ar(LeakDC.ar(GVerb.ar(EnvGen.ar(Env.perc(0,0.1),1,8,0,1,0),300,30,0.5,0.5,15,0.1,1,0.9,300,5)),9000)*XLine.kr(0.0001,0.4,2)}.play;
	~shep.stop(2);
	1.wait;
	b.sendMsg("/strobeBrightness",0);
	b.sendMsg("/strobeSpeed",0);
	2.wait;
	~heartbeat.set(\amp,0.2);
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
	~rec = {arg amp = 1; Pan2.ar(FreeVerb.ar(PlayBuf.ar(1,d["Recordings"][1],1,1,0,1),0.33,0.7)*(amp*Line.kr(0.1,1,2)))};
	~rec2 = {arg amp = 1; Pan2.ar(FreeVerb.ar(PlayBuf.ar(1,d["Recordings"][0],1,1,0,1),0.33,0.7)*(amp*XLine.kr(0.0001,0.7,5)))};
	~rec.play;
	~rec2.play;
}).start;
)

//within and not without
(
OSCdef(\fingerLights,{|msg| b.sendMsg("/l1m/",d[\fingers].(msg[1]).linlin(0,1,0,255.asInt))},\gsr);
OSCdef(\fingerRec,{| msg, ampx| ampx = d[\fingers].(msg[1]); ~rec.set(\amp,ampx,\speed,ampx); ~rec2.set(\amp,ampx,\speed,ampx)},\gsr);
OSCdef(\heartbeatFinger,{| msg, ampx| ampx = d[\fingers].(msg[1]); ~heartbeat.vol = ampx},\gsr);
)

OSCdef(\dsdjkds,{|msg| msg[1].postln;},\gsr)



// OSCFunc.trace

//HARD STOP the second time charlie says anything


(
~rec.stop(20);
~rec2.stop(20);
~heartbeat.stop(10);
)

//CHORUS AND CONTROL

//bird and guitar fade out in advance of the choral piece coming in
