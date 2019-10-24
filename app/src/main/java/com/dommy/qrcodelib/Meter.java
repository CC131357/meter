package com.dommy.qrcodelib;


public class Meter {
    public String id;
    public String location;
    public String time;
    public String record;

    public Meter(){
        this.id = id;
        this.location = location;
        this.time = time;
        this.record = record;
    }

    public String getId(){
        return id;
    }
    public void setId(String id){
        this.id = id;
    }
    public String getLocation(){
        return location;
    }
    public void setLocation(String location){
        this.location = location;
    }
    public String getTime(){
        return time;
    }
    public void setTime(String time){
        this.time = time;
    }
    public String getRecord(){
        return record;
    }
    public void setRecord(String record){
        this.record = record;
    }
    /*
    public String toString(){
        return "Meter[id = "+id+",location = "+location+",time = "+time+",record = "+record+"]";
    }
    */

}
