/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author linangran
 */
@MappedSuperclass
public abstract class BaseEntity implements Serializable
{
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int ID;

    public int getID()
    {
	return ID;
    }

    public void setID(int ID)
    {
	this.ID = ID;
    }

}
