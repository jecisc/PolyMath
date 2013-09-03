as yet unclassified
mainStepsPrevState: prevState prevPrevState: prevPrevState startTime: initialTime endTime: endTime
	|previousState previousPrevState |
	previousState := prevState.	
	previousPrevState:=prevPrevState.
	"don't go to end time to avoid overrunning"
	(lastTime to: endTime - self dt  by: self dt) do: 
		[:time | | tempState1 tempState2|
			tempState1 := state.
			tempState2:=previousState.
			state := stepper
				doStep: state 
				prevState: previousState
				prevPrevState: previousPrevState
				time:  time 
				stepSize: self dt.
			previousPrevState:=tempState2.	
			previousState := tempState1.
			"announce step results"
			self announceState: state time: time + self dt.
			lastTime := time + self dt].  
		^ { previousPrevState. previousState }