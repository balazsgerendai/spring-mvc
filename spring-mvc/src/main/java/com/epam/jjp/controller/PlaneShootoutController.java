package com.epam.jjp.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.epam.jjp.domain.City;
import com.epam.jjp.domain.Game;
import com.epam.jjp.domain.Plane;
import com.epam.jjp.domain.Plane.PlaneType;
import com.epam.jjp.domain.Route;
import com.epam.jjp.service.PlaneShootoutService;

@Controller
@SessionAttributes({ "cityForm", "routeForm" })
public class PlaneShootoutController {
	private static final Logger LOG = LoggerFactory
			.getLogger(PlaneShootoutController.class);

	@Autowired
	private PlaneShootoutService service;

	@RequestMapping(value = "/planes", method = RequestMethod.GET)
	public String planeShootout(final Model model) {
		populateData(model);
		return "planes";
	}

	@RequestMapping(value = "/planes/addPlane", method = RequestMethod.POST)
	public String addPlane(
			@ModelAttribute("planeForm") final PlaneForm planeForm,
			final Model model) {
		Plane plane = new Plane();
		plane.setName(planeForm.getName());
		plane.setType(planeForm.getType());
		plane.setHp(planeForm.getHp());
		service.addPlane(plane);

		populateData(model);
		return "planes";
	}

	@RequestMapping(value = "/planes/addCity", method = RequestMethod.POST, params = "step=cityAttributes")
	public String addCityAttributes(final CityForm cityForm,
			final PlaneType type, final Integer likelihood,
			final Integer firePower, final Model model) {
		LOG.info("[" + type + "," + likelihood + "," + firePower + "]");
		if (type != null) {
			cityForm.setLikelihood(type, likelihood);
			cityForm.setFirePower(type, firePower);
		}

		populateData(model);
		return "cityAttributes";
	}

	@RequestMapping(value = "/planes/addCity", method = RequestMethod.POST, params = "step=done")
	public String addCityDone(final CityForm cityForm,
			final SessionStatus sessionStatus, final Model model) {
		City city = new City();
		city.setName(cityForm.getName());
		city.setLikelihoods(cityForm.getLikelihoods());
		city.setFirePowers(cityForm.getFirePowers());
		service.addCity(city);

		sessionStatus.setComplete();

		populateData(model);
		return "planes";
	}

	@RequestMapping(value = "/planes/addRoute", method = RequestMethod.POST, params = "step=routeCities")
	public String addRouteCities(final RouteForm routeForm, String city,
			final Model model) {
		if (city != null) {
			routeForm.addEnRouteCity(service.getCityByName(city));
		}

		populateData(model);
		return "routeCities";
	}

	@RequestMapping(value = "/planes/addRoute", method = RequestMethod.POST, params = "step=done")
	public String addRouteDone(final RouteForm routeForm,
			final SessionStatus sessionStatus, final Model model) {
		// System.out.println(routeForm.getGoal());
		System.out.println(routeForm == null);
		Route route = new Route();
		route.setName(routeForm.getName());
		route.setGoal(service.getCityByName(routeForm.getGoal()));
		route.setStart(service.getCityByName(routeForm.getStart()));
		route.setEnRouteCities(routeForm.getEnRouteCities());

		service.addRoute(route);

		sessionStatus.setComplete();

		populateData(model);
		return "planes";
	}
	
	@RequestMapping(value = "/planes/addGame", method = RequestMethod.POST, params = "step=addRoutes")
	public String addGame(final String plane, String route,
			final SessionStatus sessionStatus, final Model model) {
		if(plane!=null && route!=null){
			Game game = new Game();
			game.addPlaneRoutes(service.getPlaneByName(plane),service.getRouteByName(route));
			service.setGame(game);
			sessionStatus.setComplete();
			
			return "planes";
		}
		populateData(model);
		return "gameAttribute";
	}
	
	@RequestMapping(value = "/planes/playGame", method = RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public @ResponseBody String playGame() {
		String response = "Game not initalised";
		Game game = service.getGame();
		if(game!= null){
			game.startGame();
			response =  "<h1>"+game.gameResult() +"</h1>";
		}
		
		return response;
	}

	private void populateData(final Model model) {
		model.addAttribute("planeTypes", PlaneType.values());
		model.addAttribute("cities", service.getCities());
		model.addAttribute("planes", service.getPlanes());
		model.addAttribute("routes", service.getRoutes());

	}
}
