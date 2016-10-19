(
s.options.numBuffers = 1024 * 16;
s.options.memSize = 8192 * 16;
s.boot;
p=ProxySpace.push(s);
p.makeTempoClock;
c=NanoKontrol.new;
p.clock.tempo = 1;
s.scope;
b = NetAddr("127.0.0.1", 7700);
Task({
	3.wait;
	d = Dictionary.new;
	d.add(\foldernames -> PathName(thisProcess.nowExecutingPath.dirname +/+ "Samples").entries);
	for (0, d[\foldernames].size-1,
		{arg i; d.add(d[\foldernames][i].folderName -> d[\foldernames][i].entries.collect({
			arg sf;
			Buffer.read(s,sf.fullPath);
		});
	)});
	("SynthDefs.scd").loadRelative;
	3.wait;
	StageLimiter.activate;
	1.wait;
	"Setup done!".postln;
}).start;
)

//RUN THIS!!!!!!!!!!!!!!!!

(
var prev = 0;
d[\diff1] = { |in|
    var result = in - prev;
    prev = in;
    result;
	result = if ( result < 300, {10},{result});
};
);

(
d[\fingers] = { |in|
	if (in == 1023, {0}, {1});
};
);


