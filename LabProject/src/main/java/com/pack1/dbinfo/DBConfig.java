package com.pack1.dbinfo;

import java.io.InputStream;
import java.util.Properties;

public class DBConfig {

    private static Properties props = new Properties();

    static {
        try {
            InputStream is = DBConfig.class.getClassLoader()
                    .getResourceAsStream("db.properties");

            if (is == null) {
                throw new RuntimeException("db.properties not found in classpath!");
            }

            props.load(is);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String get(String key) {
        return props.getProperty(key);
    }
}
