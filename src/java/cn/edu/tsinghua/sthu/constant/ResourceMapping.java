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
	"二级审批部门","物业中心","C楼物业","C楼电子屏","教务处", 
        "党委宣传部", "国际处", "港澳办", "环保办", "物业中心综合治理办公室"
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
