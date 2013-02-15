/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.constant;

/**
 *
 * @author linangran
 */
public class ResourceMapping {
    public static final String[] names = {
	"校团委"
    };
    
    public static final String[] accounts = new String[names.length];
    
    public static int getIdByName(String s)
    {
	for (int i = 0; i < names.length; i++)
	{
	    if (names[i].equals(s)) {
		return i;
	    }
	}
	return -1;
    }
}
