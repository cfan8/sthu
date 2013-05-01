/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javamail;
import java.util.LinkedList;
import java.util.List;
/**
 *
 * @author elsie
 */
public class Queue {
    private static Queue queue = new Queue();
    private List list;
    public static final int Size = 10;
    public Queue(){
        list = new LinkedList();
    }
    public static Queue getInstance(){
        return queue;
    }
    public boolean isFull(){
        return list.size() == Size;
    }
    public void add(Object obj){
        list.add(obj);
    }
    public boolean isEmpty(){
        return list.isEmpty();
    }
    public void clear(){
        list.clear();
    }
    public Object poll() {
        return (Object) list.remove(0);
    }
}
