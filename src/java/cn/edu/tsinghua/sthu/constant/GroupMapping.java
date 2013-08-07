/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.constant;

/**
 *
 * @author xiaobo
 */
public class GroupMapping {
    public static final String[] names = {"校团委审批部门", "校团委"};

    public static int getIdByName(String s) {
	for (int i = 0; i < names.length; i++) {
	    if (names[i].equals(s)) {
		return i;
	    }
	}
	return -1;
    }
}
