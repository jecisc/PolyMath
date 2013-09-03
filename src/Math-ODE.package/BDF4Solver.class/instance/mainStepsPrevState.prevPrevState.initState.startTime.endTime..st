as yet unclassified
mainStepsPrevState: prevState prevPrevState: prevPrevState initState: initState  startTime: initialTime endTime: endTime
	|previousState previousPrevState initialState |

	previousState := prevState.	
	previousPrevState:=prevPrevState.
	initialState:=initState.
	"don't go to end time to avoid overrunning"
	(lastTime to: endTime - self dt  by: self dt) do: 
		[:time | | tempState1 tempState2 tempState3|

			tempState1:=state.
			tempState2:=previousState.
			tempState3:=previousPrevState.
			state := stepper
				doStep3State: state 
				secondState: previousState
				firstState: previousPrevState
				initState: initialState 
				thirdTime: time   
				stepSize: self dt.
			initialState:=tempState3.
			previousPrevState:=tempState2.	
			previousState := tempState1.
			"announce step results"
			self announceState: state time: time + self dt.
			lastTime := time + self dt].
			
	^ { initialState. previousPrevState. previousState}