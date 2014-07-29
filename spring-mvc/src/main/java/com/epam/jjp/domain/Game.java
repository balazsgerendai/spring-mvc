package com.epam.jjp.domain;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;

import com.epam.jjp.domain.Plane.PlaneType;

public class Game {
	private Map<Plane, Route> planeRoutes = new HashMap<>();
	private StringBuilder builder = new StringBuilder();
	private Random random = new Random();
	
	public void setPlaneRoutes(final Map<Plane, Route> planeRoutes) {
		this.planeRoutes.clear();
		this.planeRoutes.putAll(planeRoutes);
	}
	
	public void addPlaneRoutes(Plane plane, Route route) {
		this.planeRoutes.put(plane, route);
	}
	
	public Map<Plane, Route> getPlaneRoutes() {
		return Collections.unmodifiableMap(planeRoutes);
	}
	
	public void startGame(){
		for(Entry<Plane, Route> entry : planeRoutes.entrySet()) {
			Plane plane = entry.getKey();
			Route route = entry.getValue();
			PlaneType planeType = plane.getType();
			for(City city : route.getEnRouteCities()){
				int firePower = city.getFirePowers().get(planeType);
				int likeliHood = city.getLikelihoods().get(planeType);
				if(checkLikeliHood(likeliHood)){
					plane.changeHp(-1 * (firePower));
					builder.append(plane.getName() + " got hit in " + city.getName() + " for " + firePower +" damage <br />");
				}else{
					builder.append(plane.getName() + " dodged an attack from " + city.getName()+" <br />");
				}
			}
			if(plane.getHp() <= 0){
				builder.append(plane.getName() + " was shot down...<br />");
			}else{
				builder.append(plane.getName() + " made it to safety! yeah!!!<br />");
			}
		}
	}
	private boolean checkLikeliHood(int likeliHood){
		boolean attack;
		if(random.nextInt(100) > likeliHood){
			attack = true;
		}else{
			attack = false;
		}
		return attack;
	}
	
	public String gameResult(){
		return builder.toString();
	}
}
