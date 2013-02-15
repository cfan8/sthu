/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.constant;

/**
 *
 * @author linangran
 */
public class AllocateMapping {

    public static final String[] names = {"注册中心", "物业中心", "C楼"};

    public static int getIdByName(String s) {
	for (int i = 0; i < names.length; i++) {
	    if (names[i].equals(s)) {
		return i;
	    }
	}
	return -1;
    }
}
