package com.project.customer_module;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerBean implements Serializable {
    private String cusuname;
    private String cuspwd;
    private String cusfname;
    private String cuslname;
    private String cusaddr;
    private String cusmail;
    private String cusmob;
}
