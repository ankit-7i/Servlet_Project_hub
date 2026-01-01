package com.project.adminpage;

import java.io.Serializable;
import lombok.Data;

@Data   
public class AdminBean implements Serializable {

    private String a_uname;
    private String a_pwd;
    private String a_fname;
    private String a_lname;
    private String a_addr;
    private String a_mail;
    private String a_phn;

    
}
