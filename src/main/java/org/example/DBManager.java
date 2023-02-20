package org.example;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static final String url = "jdbc:postgresql://localhost:5432/postgres";
    private static final String user = "postgres";
    private static final String password = "123t456";

    private static Connection connection;

    static{
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, user, password);
            System.out.println("CONNECTION SUCCESSFUL");
        } catch (Exception e) {
            System.out.println("ERROR CONNECTION");
            e.printStackTrace();
        }
    }

    public static boolean addItem(Car car){
        int rows = 0;

        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO cars (name, model, year, volume) VALUES (?, ?, ?, ?)" +
                    "");

            statement.setString(1, car.getName());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getYear());
            statement.setDouble(4, car.getVolume());

            rows = statement.executeUpdate();
            statement.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static ArrayList<Car> getAllCars(){
        ArrayList<Car> cars = new ArrayList<>();

        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM cars");

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                cars.add(new Car(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("model"),
                        resultSet.getInt("year"),
                        resultSet.getDouble("volume")
                ));
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return cars;
    }

    public static Car getCar(int id){
        Car car = null;

        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM cars WHERE id = ? LIMIT 1");

            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()){
                car = new Car(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("model"),
                        resultSet.getInt("year"),
                        resultSet.getDouble("volume")
                );
            }
            statement.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return car;
    }

    public static boolean updateCar(Car car){
        int rows = 0;

        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE cars SET name = ?, model = ?, year = ?, volume = ? WHERE id = ?" +
                    "");

            statement.setString(1, car.getName());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getYear());
            statement.setDouble(4, car.getVolume());
            statement.setInt(5, car.getId());

            rows = statement.executeUpdate();
            statement.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return rows > 0;
    }

    public static boolean deleteCar(Car car){
        int rows = 0;

        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "DELETE FROM cars WHERE id = ?" +
                    "");

            statement.setInt(1, car.getId());

            rows = statement.executeUpdate();
            statement.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return rows > 0;
    }
}
