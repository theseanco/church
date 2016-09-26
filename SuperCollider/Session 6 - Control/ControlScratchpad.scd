//Scratchpad For Movement Control

//controlled

(
~crabs = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],1,1,0,1,0),~pulse)*Line.kr(0,0.1,10)};
~crabs2 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.7,1,0,1,0),~pulse,2)*Line.kr(0,0.1,10)};
~crabs3 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.4,1,0,1,0),~pulse,2)*Line.kr(0,0.1,10)};
~crabs4 = {LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.1,1,0,1,0),~pulse,2)*Line.kr(0,0.1,10)};
~crabs.play;
~crabs2.play;
~crabs3.play;
~crabs4.play;
)




//run this
(
var prev = 0;
d[\diff1] = { |in|
    var result = in - prev;
    prev = in;
    result;
	result = if ( result < 300, {10},{result});
};
);

// new crabs with args
//absolute control
(
OSCdef(\xdiffFilt, {|msg, filt| filt = d[\diff1].(msg[1]); ~crabs.set(\f,filt); ~crabs2.set(\f,filt); ~crabs3.set(\f,filt); ~crabs4.set(\f,filt); },\z);
~crabs = { arg f = 2000, amp = 1; LPF.ar(PlayBuf.ar(2,d["Recordings"][9],2,1,0,1,0),Lag.kr(f,0.6).abs)*Line.kr(0,1,1)};
~crabs2 = { arg f = 2000, amp = 1; LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.7,1,0,1,0),Lag.kr(f,0.6).abs,2)*Line.kr(0,1,1)};
~crabs3 = {arg f = 2000, amp = 1; LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.4,1,0,1,0),Lag.kr(f,0.6).abs,2)*Line.kr(0,1,1)};
~crabs4 = {arg f = 2000, amp = 1; LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.8,1,0,1,0),Lag.kr(f,0.6).abs,2)*Line.kr(0,1,1)};
~crabs.play;
~crabs2.play;
~crabs3.play;
~crabs4.play;
)


// new crabs with args
//absolute control
(
OSCdef(\xdiffFilt, {|msg, filt| filt = d[\diff1].(msg[1]); ~crabs.set(\f,filt); ~crabs2.set(\f,filt); ~crabs3.set(\f,filt); ~crabs4.set(\f,filt); },\z);
~crabs = { arg f = 2000, amp = 1; LPF.ar(PlayBuf.ar(2,d["Recordings"][9],2,1,0,1,0),Lag.kr(f,0.6).abs)*Line.kr(0,1,1)};
~crabs2 = { arg f = 2000, amp = 1; LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.7,1,0,1,0),Lag.kr(f,0.6).abs,2)*Line.kr(0,1,1)};
~crabs3 = {arg f = 2000, amp = 1; LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.4,1,0,1,0),Lag.kr(f,0.6).abs,2)*Line.kr(0,1,1)};
~crabs4 = {arg f = 2000, amp = 1; LPF.ar(PlayBuf.ar(2,d["Recordings"][9],0.8,1,0,1,0),Lag.kr(f,0.6).abs,2)*Line.kr(0,1,1)};
~crabs.play;
~crabs2.play;
~crabs3.play;
~crabs4.play;
)


//XFade between filtered and non-filtered version?







/*


LIGHTS!!!!!!!!!!!!!!!!!!!!!!!!!

/////////////////////////////////////////////

/////////////////////////////////////////////
/////////////////////////////////////////////
/////////////////////////////////////////////
/////////////////////////////////////////////
/////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////
/////////////////////////////////////////////
/////////////////////////////////////////////


*/


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
)

/*(
var prevLight = 0;
d[\diffLight] = { |in|
    var result = in - prevLight;
    prevLight = in;
    result;
};
);


OSCdef(\m1, {|msg| b.sendMsg("/l1m/",d[\diffLight].(msg[1]).linlin(0,16000,255,10).lag.postln)},\z);*/

OSCdef(\m1, {|msg| b.sendMsg("/l1m/",msg[1].linlin(-12000,12000,0,255).asInt)},\z);




/////////////////////////////////////////
/*
/////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
FINGERS
/////////////////////////////////////////
/////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
*/

~rec = {arg amp = 1, speed = 1; Pan2.ar(FreeVerb.ar(PlayBuf.ar(1,d["Recordings"][1],speed,1,0,1),0.33,0.7)*Line.kr(0.1,1,2),0,amp)};
~rec2 = {arg amp = 1, speed = 1; Pan2.ar(FreeVerb.ar(PlayBuf.ar(1,d["Recordings"][0],speed,1,0,1),0.33,0.7)*XLine.kr(0.0001,0.7,5),0,amp)};
~rec.play;
~rec2.play;

//FINAL LIGHTS FADE IN

//orange in the church
(
//RED
Task({var light = 0;
	255.do({
		b.sendMsg("/l1r/",light);
		light = light + 1;
		light.postln;
		0.02.wait;
})}).start;
//GREEN
Task({var light = 0;
	35.do({
		b.sendMsg("/l1g/",light);
		light = light + 1;
		light.postln;
		0.03.wait;
})}).start;
b.sendMsg("/l1b/",0);
b.sendMsg("/l1m/",255);
)

//simple function
(
d[\fingers] = { |in|
	if (in == 1023, {0}, {1});
};
);

//defs to control
(
OSCdef(\fingerLights,{|msg| b.sendMsg("/l1m/",d[\fingers].(msg[1]).linlin(0,1,0,255.asInt))},\gsr);
OSCdef(\fingerRec,{| msg, ampx| ampx = d[\fingers].(msg[1]); ~rec.set(\amp,ampx,\speed,ampx); ~rec2.set(\amp,ampx,\speed,ampx)},\gsr);
)


OSCFunc.trace