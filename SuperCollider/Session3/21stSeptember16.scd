//volume & filter control of street level sounds, based on the water splash control for tome.

~fund = 55
//recordings w/ static pulse
~pulse = {SinOsc.kr(1).range(9000,9001)}

//street sounds
(
~rec = {LPF.ar(Pan2.ar(PlayBuf.ar(1,d["Recordings"][12],1,1,0,1)*0.5),~pulse,0.8/*Line.kr(0,0.8,10)*/)};
)
~rec.play

//recordings of crabs with static pulse
(
~crabs = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],1,1,0,1,0),~pulse)*0.04};
~crabs2 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.7,1,0,1,0),~pulse,2)*0.04};
~crabs3 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.4,1,0,1,0),~pulse,2)*0.04};
~crabs4 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.1,1,0,1,0),~pulse,2)*0.04};
)

(
~rec.play;
~rec2.play;
~crabs.play;
~crabs2.play;
~crabs3.play;
~crabs4.play;
)

//descent shepherd tone
(
~shep = {     var intervals, amps; #intervals, amps = Shepard.kr(5,-0.01);(SinOsc.ar( (intervals + 50).midicps,0,Line.kr(0,1,1)) * amps).sum * 0.009 !2};
~shep.play;
)


//ascent shepherd tone, version with rumble at the start
(
~shep = {     var intervals, amps; #intervals, amps = Shepard.kr(5,XLine.kr(0.01,110,60));BLowShelf.ar((Saw.ar( (intervals + 80).midicps,Line.kr(0,1,1)) * amps).sum * 0.09 !2,300,1,7)};
~shep.play;
)


//ascent shepherd tone, version with rumble at the start and low pass
(
~shep = {     var intervals, amps; #intervals, amps = Shepard.kr(5,XLine.kr(0.01,110,60));BLowShelf.ar(LPF.ar(((Saw.ar( (intervals + 80).midicps,Line.kr(0,1,1)) * amps).sum * 0.09 !2),Line.kr(500,19000,60)),300,1,7)};
~shep.play
)

//ascent shepherd tone, version with rumble at the start and low pass edited
(
~shep = {     var intervals, amps; #intervals, amps = Shepard.kr(5,XLine.kr(0.01,110,60));BLowShelf.ar(LPF.ar(BHiShelf.ar(((Saw.ar( (intervals + 80).midicps,Line.kr(0,1,1)) * amps).sum * 0.09 !2),3000,1,7),XLine.kr(200,19000,60)),300,1,7)};
~shep.play
)

//shepherd tone should build and build and build and build and then peter out into the street sound


//Thunder, this is a good one :)
{LPF.ar(LeakDC.ar(GVerb.ar(EnvGen.ar(Env.perc(0,0.1),1,8,0,1,0),300,30,0.5,0.5,15,0.1,1,0.9,300,5)),9000)*XLine.kr(0.0001,1,2)}.play;





//Thunder TASK, general for Charlie's 'getting up', shepherd tone becomes ridiculous, thunder is triggered and the sheperd tone comes out, birds play again.

//the rise & the strobe need to be on a knob for this, then i can trigger a task which will handle the thunder.
(
Task({
	~pulsemaster = {Impulse.kr(65/60)};
	~pulse2 = {EnvGen.ar(Env.perc(0.3,0.2),~pulsemaster.kr)};
	~heartbeat = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,0.2/*Line.kr(0,0.1,20)*/).flat*~pulse2.ar};
	~heartbeat.play;
	~shep = {     var intervals, amps; #intervals,
		amps = Shepard.kr(5,XLine.kr(0.01,110,45));BLowShelf.ar(LPF.ar(BHiShelf.ar(((Saw.ar( (intervals + 80).midicps,Line.kr(0,1,1)) * amps).sum * 0.1 !2),3000,1,10),Line.kr(500,19000,60)),300,1,7)};
	~shep.play;
	50.wait;
	{LPF.ar(LeakDC.ar(GVerb.ar(EnvGen.ar(Env.perc(0,0.1),1,8,0,1,0),300,30,0.5,0.5,15,0.1,1,0.9,300,5)),9000)*XLine.kr(0.0001,0.5,2)}.play;
	~shep.stop(4);
	2.wait;
	~heartbeat = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0.2,0.1/*Line.kr(0,0.1,20)*/).flat*~pulse2.ar};
	~pulsemaster = {Impulse.kr(50/60)};
	//pulse also needs to be quieter
	20.wait;
	~rec = {Pan2.ar(FreeVerb.ar(PlayBuf.ar(1,d["Recordings"][1],1,1,0,1),0.33,0.7)*0.9)};
	~rec.play;
}).start;
)



~rec.play;


//this pulse will be going underneath the song, which will then speed up and drop in volume during the text and speed up and increase in volume throughout , before the strobe it will turn off, charlie will say text and then this will come in super hard, along with the strobe
(
~fund = 41.2;
~pulsemaster = {Impulse.kr(65/60)};
~pulse2 = {EnvGen.ar(Env.perc(0.3,0.2),~pulsemaster.kr)};
~heartbeat = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,0.2/*Line.kr(0,0.1,20)*/).flat*~pulse2.ar};
~heartbeat.play;
)

(
var prev = 0;
q = { |in|
    var result = in - prev;
    prev = in;
    result;
	result = if ( result < 300, {0},{result});
};
);

~splash = {arg amp = 0.7; Pan2.ar(PlayBuf.ar(1,d[\water][2],1,1,0,1,0)*Lag.kr(amp/100,0.5),SinOsc.kr(0.1,0,0.7))};


~rec2.play




//orange sound, this is due to take out the street sound.

~fund.fadeTime=2
~fund = 41.2
(
~dfm = {DFM1.ar(Splay.ar(Pulse.ar([~fund,~fund*4,~fund*8,~fund*9,~fund*LFNoise1.kr(LFNoise1.kr(0.1).range(0.01,1)).range(1,16).round(2)],SinOsc.kr(0.1).range(0.1,0.9),[LFNoise1.kr(0.4).range(0,0.2),LFNoise1.kr(0.4).range(0,0.2),LFNoise1.kr(0.4).range(0,0.2),LFNoise1.kr(0.4).range(0,0.15),LFNoise1.kr(0.4).range(0,0.15)])),~fund*10,LFNoise1.kr(0.1).range(0.01,0.1),1,0,mul:Line.kr(0,0.2,20))};
~four = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,Line.kr(0.5,0.1,20)).flat*~pulse.ar};
~pulse = {EnvGen.ar(Env.perc(0.3,0.2),~pulsemaster)};
~rec.stop(10);
~dfm.play;
)

~dfm.stop(10)

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



//maybe guitar (d["Recordings"][0]) after the storm


d["Recordings"][0].play
d["Recordings"][1].play

d["Recordings"][12].play



