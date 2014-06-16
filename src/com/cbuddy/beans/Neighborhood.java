package com.cbuddy.beans; 


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Neighborhood")

public class Neighborhood {
	private int id;
	private String locCode;
	private String neighborLocCode;
	private String neighborLocName;
	private int distance;
	
	@Id
	@Column(name="ID")
	public int getId(){
		return id;
	}public void setId(int id){
		this.id = id;
	}
	
	
	
	@Column(name="LOC_CODE")
	public String getLocCode() {
		return locCode;
	}
	public void setLocCode(String locCode) {
		this.locCode = locCode;
	}
	
	@Column(name="NEIGHBOR_LOC_CODE")
	public String getNeighborLocCode() {
		return neighborLocCode;
	}
	public void setNeighborLocCode(String neighborLocCode) {
		this.neighborLocCode = neighborLocCode;
	}
	
	@Column(name="NEIGHBOR_LOC_NAME")
	public String getNeighborLocName() {
		return neighborLocName;
	}
	public void setNeighborLocName(String neighborLocName) {
		this.neighborLocName = neighborLocName;
	}
	
	@Column(name="DISTANCE")
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}

}
