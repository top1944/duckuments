class CoordinationSwitch
	
	# constructor
	def __init__(self, mode)
		self.mode = mode
		
	# methods
	def update_mode(self, mode, intersection_type)
		if self.mode != mode:
			if mode == coordinationMode:
				if intersection_type == trafficLight:
					coord = TrafficLightCoordination()
					coord.activate()
				else:
					coord = StopSignCoordination()
					coord.activate()
			elif mode == laneFollowing:
				coord = IntersectionExitCoordination()
				coord.activate()