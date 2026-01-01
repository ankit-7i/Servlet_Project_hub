package com.app.model;

import lombok.Data;
import java.io.Serializable;

@Data
public class AdminBean implements Serializable {
    private String uname;
    private String pword;
    private String fname;
    private String lname;
    private String addr;
    private String mail;
    private String phn;
}
