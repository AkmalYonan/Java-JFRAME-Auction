/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

/**
 *
 * @author Fikri Khairul Shaleh
 */
public class UserSession {
    private static int id;
    private static String username,password,name,role,level;
    
    public static void setId(int id){
        UserSession.id = id;
    }

    public static void setUsername(String username){
        UserSession.username = username;
    }
    
    public static void setPassword(String password){
        UserSession.password = password;
    }
    
    public static void setName(String name){
        UserSession.name = name;
    }
    
    public static void setLevel(String level){
        UserSession.level = level;
    }
    
    public int getId(){
        return id;
    }
    
    public String getUsername(){
        return username;
    }
    
    public String getPassword(){
        return password;
    }
    
    public String getName(){
        return name;
    }
    
    public String getLevel(){
        return level;
    }

    public static String getRole() {
        return role;
    }

    public static void setRole(String role) {
        UserSession.role = role;
    }
    
}
