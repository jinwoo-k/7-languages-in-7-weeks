-module(exam_translate_service_doctor).
-export([loop/0]).

loop() ->
	process_flag(trap_exit, true),
	receive
		new ->
			io:format("Creating and monitoring process.~n"),
			register(service, spawn_link(fun translate_service:loop/0)),
			loop();
		{'EXIT', From, Reason} ->
			io:format("The service ~p died with reason ~p", [From, Reason]),
			io:format(" Restarting. ~n"),
			self() ! new,
			loop()
		end.


% ----- usage
% Doctor = spawn(fun exam_translate_service_doctor:loop/0).
% Doctor ! new.
% translate_service:translate(service, "casa").