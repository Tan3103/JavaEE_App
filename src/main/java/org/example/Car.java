package org.example;

public class Car {
    private int id;
    private String name;
    private String model;
    private int year;
    private double volume;

    public Car(){
    }

    public Car(int id, String name, String model, int year, double volume) {
        this.id = id;
        this.name = name;
        this.model = model;
        this.year = year;
        this.volume = volume;
    }

    public Car(String name, String model, int year, double volume) {
        this.name = name;
        this.model = model;
        this.year = year;
        this.volume = volume;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public double getVolume() {
        return volume;
    }

    public void setVolume(double volume) {
        this.volume = volume;
    }
}
