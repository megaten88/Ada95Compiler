/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package a95compiler;
import java.util.ArrayList;

/**
 *
 * @author megaten
 */
public class Node {
    private int id;
    private String value;
    private String simplifier;
    private String type;
    
    private ArrayList<Node> children = new ArrayList<>();
    private Node parent;
    
    public Node(){
        /*Empty constructor if case needed.*/
    }

    
    public Node(int id, String value) {
        this.id = id;
        this.value = value;
    }

    public Node(int id, String value, String simplifier, String type) {
        this.id = id;
        this.value = value;
        this.simplifier = simplifier;
        this.type = type;
    }
    
    public Node(int id) {
        this.id = id;
    }

    public Node(String simplifier, String value) {
        this.value = value;
        this.simplifier = simplifier;
    }

    public Node(String simplifier, String value,int id) {
        this.value = value;
        this.simplifier = simplifier;
        this.id = id;
    }

    public Node(String simplifier, int id) {
        this.id = id;
        this.simplifier = simplifier;
    }
    

    public Node(int id, String value, String type) {
        this.id = id;
        this.value = value;
        this.type = type;
    }
   
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getSimplifier() {
        return simplifier;
    }

    public void setSimplifier(String simplifier) {
        this.simplifier = simplifier;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public ArrayList<Node> getChildren() {
        return children;
    }

    public void setChildren(ArrayList<Node> children) {
        for (Node child : children){
            child.setParent(this);
        }
        this.children = children;
    }
    
    public void pushChild(Node child){
        child.setParent(this);
        this.children.add(child);
    }

    public void setParent(Node parent){
        this.parent = parent;
        
    }

    @Override
    public String toString() {
        if(this.simplifier!= null || this.simplifier!= ""){
            return "TAG: " + this.simplifier + "\nID: "+ this.id +"\nValue: " + this.value;
        }else{
            return "ID: "+ this.id +"\nValue: " + this.value;
        }
        
    }
    
}
