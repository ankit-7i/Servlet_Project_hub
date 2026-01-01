package com.app.model;

import lombok.Data;
import java.io.Serializable;

@Data
public class TicketBean implements Serializable {
    private String pname;
    private int    age;
    private String phone;
    private String train;
    private int    passengers;
    private String source;
    private String destination;
    private String gender;
    private String classType;   // General/Sleeper/3rd AC/2nd AC/1st AC
    private String facilities;  // comma separated
    private double price;
    private String berth;       // random berth code
}
