package com.meltum.beans;

import java.util.ArrayList;
import java.util.List;

public class Zone {
	List<Points> points = new ArrayList<Points>();

	public List<Points> getPoints() {
		return points;
	}

	public void setPoints(List<Points> points) {
		this.points = points;
	}
}
