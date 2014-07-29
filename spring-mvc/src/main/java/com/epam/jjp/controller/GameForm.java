package com.epam.jjp.controller;

import java.util.HashMap;
import java.util.Map;

import com.epam.jjp.domain.Plane;
import com.epam.jjp.domain.Route;

public class GameForm {
	private Map<Plane, Route> planeRoutes = new HashMap<>();

	public Map<Plane, Route> getPlaneRoutes() {
		return planeRoutes;
	}

	public void setPlaneRoutes(Map<Plane, Route> planeRoutes) {
		this.planeRoutes = planeRoutes;
	}
}
