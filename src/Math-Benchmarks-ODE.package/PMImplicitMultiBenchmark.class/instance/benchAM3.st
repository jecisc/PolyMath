benchmarking
benchAM3
	| solver stepper |
	stepper := AM3Stepper onSystem: system.
	solver := (AM3Solver new) stepper: stepper; system: system; dt: dt.
	 1 to: self problemSize do: [  :i 
		 |solver solve: system startState: startState startTime:startTime endTime: endTime]