//24th August

//opening hymn
//street-level sounds
//move down into subterranean thing for the text
//pulse can build
//control grows


//fundamental of 55 is A
~fund = 55

//Above Ground, field recording of chatter, setting scene after humn
(
~fund = 55;
~rec = {HPF.ar(Pan2.ar(PlayBuf.ar(1,d["Recordings"][1],1,1,0,1)*0.5),200,Line.kr(0,0.8,10))};
~rec2 = {HPF.ar(Pan2.ar(PlayBuf.ar(1,d["Recordings"][2],1,1,0,1))*LFNoise1.kr(0.1).range(0.01,0.5),300,Line.kr(0,0.8,10))};
~rec.play;
~rec2.play;
)
~rec2.clear

//fading of reality, changing of field recordings that isn't just 'adding reverb lol'.
(
~decay1 = {WaveLoss.ar(~rec,Line.kr(0,100,20),100,2)};
~decay2 = {WaveLoss.ar(~rec2,Line.kr(0,100,20),100,2)};
~rec.stop;
~rec2.stop;
~decay1.play;
~decay2.play;
)

//pulse for the descent, coming out of the previous section, this needs to be REEEALLL QUIET at the beginning

//short pulses
(
//65bpm
~pulse = {EnvGen.ar(Env.perc(0.3,0.2),Impulse.kr(65/60))};
~four = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,Line.kr(0,0.1,20)).flat*~pulse.ar};
~four.play;
)

//short pulses fade further in
~four = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,Line.kr(0.1,0.3,20)).flat*~pulse.ar};

//short pulses fade further in
~four = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,Line.kr(0.3,0.5,20)).flat*~pulse.ar};

//original
~four = {SinOsc.ar([~fund,~fund*1.01],0,2)*EnvGen.ar(Env.perc(0.01,7),Impulse.kr(1/8))};
~four.play

//A sound the colour of orange - This needs to be warmer
(
~dfm = {DFM1.ar(Splay.ar(Pulse.ar([~fund,~fund*4,~fund*8,~fund*9,~fund*LFNoise1.kr(LFNoise1.kr(0.1).range(0.01,1)).range(1,16).round(2)],SinOsc.kr(0.1).range(0.1,0.9),[LFNoise1.kr(0.4).range(0,0.2),LFNoise1.kr(0.4).range(0,0.2),LFNoise1.kr(0.4).range(0,0.2),LFNoise1.kr(0.4).range(0,0.15),LFNoise1.kr(0.4).range(0,0.15)])),~fund*10,LFNoise1.kr(0.1).range(0.01,0.1),1,0,mul:Line.kr(0,0.2,20))};
~dfm.play;
)

//pulse & bird fades out
(
~four = {SinOsc.ar([~fund,~fund*LFNoise1.kr(0.2).range(1,1.09)],0,Line.kr(0.5,0.1,20)).flat*~pulse.ar};
~pulse = {EnvGen.ar(Env.perc(0.3,0.2),Impulse.kr(50/60))};
~rec.stop(10);
)

//steps, orange fades out
(
Task({
	~dfm.stop(20);
	~rec2.stop(20);
	20.wait;
	~dfm.clear;
	~rec.clear;
	~rec2.clear;
}).start;
)


//crabs
//a volume control of this could be given to the suit
~two = {Warp1.ar(2,d["Recordings"][8],SinOsc.kr(0.4),0.2,interp:4,mul:SinOsc.kr(0.1,0,Line.kr(0,0.05,20)).abs)};
~two.play;

//crabs 2
(
~crabpulse = 1;
~crabs = {PlayBuf.ar(2,d["Recordings"][8],Line.kr(0.1,1,2)*~crabpulse.abs,1,0,1,0)*0.1};
~crabs2 = {PlayBuf.ar(2,d["Recordings"][8],Line.kr(0.1,0.7,2)*~crabpulse.abs,1,0,1,0)*0.1};
~crabs3 = {PlayBuf.ar(2,d["Recordings"][8],Line.kr(0.1,0.4,3)*~crabpulse.abs,1,0,1,0)*0.1};
~crabs4 = {PlayBuf.ar(2,d["Recordings"][8],Line.kr(0.01,0.1,3)*~crabpulse.abs,1,0,1,0)*0.1};
~crabs.play;
~crabs2.play;
~crabs3.play;
~crabs4.play;
)

//change pulse of crab sounds
(
~pulsemaster = {Impulse.kr(65/60)};
~pulse = {EnvGen.ar(Env.perc(0.3,0.2),~pulsemaster.kr)};
~crabs = {BPF.ar(PlayBuf.ar(2,d["Recordings"][8],Line.kr(0.1,1,2)*~crabpulse.abs,1,0,1,0),1000,0.5)*0.2};
~crabs2 = {BPF.ar(PlayBuf.ar(2,d["Recordings"][8],Line.kr(0.1,0.7,2)*~crabpulse.abs,1,0,1,0),1000,0.5)*0.2};
~crabs3 = {BPF.ar(PlayBuf.ar(2,d["Recordings"][8],Line.kr(0.1,0.4,3)*~crabpulse.abs,1,0,1,0),1000,0.5)*0.2};
~crabs4 = {BPF.ar(PlayBuf.ar(2,d["Recordings"][8],Line.kr(0.01,0.1,3)*~crabpulse.abs,1,0,1,0),1000,0.5)*0.2};
~crabpulse = {EnvGen.ar(Env.perc(0.5,1),~pulsemaster.kr)};
~four.play;
)

//shephard tone, for subterranean section?
~shep = {     var intervals, amps; #intervals, amps = Shepard.kr(5,-0.01);(SinOsc.ar( (intervals + 80).midicps) * amps).sum * ((~pulse*0.005)+0.0017) !2}
~shep.play

//Thought == Form?

/*

As Charlie descends into the hallucination, control builds, into the building o a simple gesture which initially did nothing, then that gesture ends up controlling the entire field.


*/

//return to street level
(
~rec = {HPF.ar(Pan2.ar(PlayBuf.ar(1,d["Recordings"][1],Line.kr(0.01,1,7),1,0,1)*0.5,200))};
~rec2 = {HPF.ar(Pan2.ar(PlayBuf.ar(1,d["Recordings"][2],Line.kr(0.01,1,7),1,0,1))*LFNoise1.kr(0.1).range(0.01,0.5),300,XLine.kr(0.000001,1,2))};
~decay1 = {RLPF.ar(~rec.ar,Line.kr(10,10000,4),0.3)};
~decay2 = {RLPF.ar(~rec2.ar,Line.kr(10,10000,4),0.3)};
~rec.stop;
~rec2.stop;
~decay1.play;
~decay2.play;
)

//maybe choir at the end in the distance?

s.scope