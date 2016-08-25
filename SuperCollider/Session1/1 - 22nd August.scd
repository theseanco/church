// CHURCH(!!)

/*

example knob function
c.knob1.onChanged = {|val| "fund = ".post; ~fund = val.linlin(0,127,40,100).postln};

*/


/*

Recordings

0 = Guitar being played

1 = bird at the top of messada

2 = Orthodox eucharist

3 = Call to prayer

4 = Jazz band

5 = Some chanting in the church

6 = O come o come emmanuel

7 = Coming down from the mount of olives

8 = Metal Curtain

9 = The sample from behind the call to prayer

10 = Aeroplane

*/

~hpf = 1000
c.knob1.onChanged = {|val| "fund = ".post; ~hpf= val.linlin(0,127,500,10000).postln};

(
//faded call to prayer with crackles and sines
~rec = {PlayBuf.ar(1,d["Recordings"][3],1,1,0,1)};
~one = {GVerb.ar(HPF.ar(~rec.ar,~hpf),20,40,0.1)*EnvGen.ar(Env.perc(4,3),Dust.kr(1))};
~one.play;
~two = {PlayBuf.ar(2,d["Recordings"][8],0.05,1,4000,1)*0.4};
~three = {SinOsc.ar([50,50+LFNoise1.kr(0.1,1)],0,1)}
)


(
//faded guitar
~rec = {PlayBuf.ar(1,d["Recordings"][0],1,1,0,1)};
~one = {GVerb.ar(HPF.ar(~rec.ar,1000,0.1),20,4,0.1,mul:2)};
~one.play;
)

~four = {SinOsc.ar([~fund,~fund*1.05],1)*EnvGen.ar(Env.perc(0.01,7),Impulse.kr(1/10))}
~four2 = {SinOsc.ar([70,60]*1.1,1)*EnvGen.ar(Env.perc(0.01,7),Impulse.kr(0.05))}
~four3 = {SinOsc.ar([70,60]*1.2,1)*EnvGen.ar(Env.perc(0.01,7),Impulse.kr(0.05))}

~four.play

~fund = 50


666/60

~four.play

~five = {PlayBuf.ar(2,d["Recordings"][9])*EnvGen.ar(Env.perc(0.01,4),Impulse.kr(0.1))}

~six = {PlayBuf.ar(2,d["Recordings"][9],0.8)*EnvGen.ar(Env.perc(0.01,3),Impulse.kr(0.1))}

~seven = {PlayBuf.ar(2,d["Recordings"][9],1.1)*EnvGen.ar(Env.perc(0.01,3),Impulse.kr(0.1))}

~ocome = {Pan2.ar(Warp1.ar(1,d["Recordings"][6],SinOsc.kr(0.00001),2,overlaps:30,windowRandRatio:0.04,interp:4,mul:0.3))}

~ocome.play

~five.play

~rain = {100}
~pitch = {0.2}

c.knob3.onChanged = {|val| ~rain = val.linlin(0,127,10,2000).postln;}
c.knob4.onChanged = {|val| ~pitch = val.linlin(0,127,0.01,3).postln;}

~dust = {PitchShift.ar(Dust.ar([~rain,~rain*1.1],0.9),0.2,~pitch)}

~dust.play


//BIG RUMBLE!!
(
~fund = 50;
~d2 = {DFM1.ar(SinOsc.ar(Array.fill(2,~fund*{rrand(0.98,1.02)}),0,0.1),~fund*2,LFNoise1.kr(0.1).range(0.5,1.4),mul:0.5)};
~four = {SinOsc.ar([~fund*1,~fund*1.02],1)*EnvGen.ar(Env.perc(0.01,7),Impulse.kr(1/10))};
)


//BIG RUMBLE2!!
(
~fund = 50;
~d2 = {DFM1.ar(SinOsc.ar(Array.fill(2,~fund*{rrand(0.98,1.02)}),0,0.1),~fund*2,LFNoise1.kr(0.1).range(0.5,3.4),mul:0.5)};
~four = {SinOsc.ar([~fund*1,~fund*1.02],1)*EnvGen.ar(Env.perc(0.01,7),Impulse.kr(1/10))};
~five = {Mix.ar(SinOsc.ar(~fund*10,0.7)*EnvGen.ar(Env.perc(0.01,0.01),Impulse.kr([1/5,1/3,2/3,1/2]*2)))}
)

~five.play
~fund = 50

~d2.play
~four.play

~euch.clear
~euch.play