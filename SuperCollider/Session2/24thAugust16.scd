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
~rec = {HPF.ar(Pan2.ar(PlayBuf.ar(1,d["Recordings"][1],1,1,0,1)*0.5),200,Line.kr(0,1,10))};
~rec2 = {HPF.ar(Pan2.ar(PlayBuf.ar(1,d["Recordings"][2],1,1,0,1))*LFNoise1.kr(0.1).range(0.01,0.5),300,Line.kr(0,1,10))};
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
//1.7 decided on as the speed of the pulses
~pulse = {EnvGen.ar(Env.perc(0.3,0.2),Impulse.kr(1.7))};
~four = {SinOsc.ar([~fund,~fund*1.01],0,Line.kr(0,0.1,20)).flat*~pulse.ar};
~four.play;
)

//short pulses fade further in
~four = {SinOsc.ar([~fund,~fund*1.01],0,Line.kr(0.1,0.3,20)).flat*~pulse.ar};

//short pulses fade further in
~four = {SinOsc.ar([~fund,~fund*1.01],0,Line.kr(0.3,0.5,20)).flat*~pulse.ar};

//original
~four = {SinOsc.ar([~fund,~fund*1.01],0,2)*EnvGen.ar(Env.perc(0.01,7),Impulse.kr(1/8))};
~four.play

//A sound the colour of orange - This needs to be warmer
~dfm = {DFM1.ar(Splay.ar(LFTri.ar([~fund*4,~fund*8,~fund*9,~fund*2,~fund*LFNoise1.kr(LFNoise1.kr(0.1).range(0.01,1)).range(1,16).round(2)],0,[LFNoise1.kr(0.4).range(0,0.2),LFNoise1.kr(0.4).range(0,0.2),LFNoise1.kr(0.4).range(0,0.2),LFNoise1.kr(0.4).range(0,0.15),LFNoise1.kr(0.4).range(0,0.15)])),~fund*10,LFNoise1.kr(0.1).range(0.01,0.1),1,0)}
~dfm.play

//crabs
//a volume control of this could be given to the suit
~two = {Warp1.ar(2,d["Recordings"][8],LFTri.kr(LFTri.kr(0.1).range(0.005,0.1)),1,0.2,interp:4,mul:SinOsc.kr(0.1,0,0.1).abs)}
~two.play

//shephard tone, for subterranean section?
~shep = {     var intervals, amps; #intervals, amps = Shepard.kr(5,-0.004);(SinOsc.ar( (intervals + 60).midicps) * amps).sum * 0.2 ! 2}

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