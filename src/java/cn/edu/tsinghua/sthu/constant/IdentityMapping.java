/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.constant;

/**
 *
 * @author linangran
 */
public class IdentityMapping {

    public static final String[] names = {
	"选择一个审批通道",
	"校团委社团社团部",
	"建筑[本]",
	"土木[本]",
	"水利[本]",
	"环境学院[本]",
	"机械[本]",
	"精仪[本]",
	"热能[本]",
	"汽车[本]",
	"工业工程[本]",
	"电机[本]",
	"电子[本]",
	"计算机[本]",
	"自动化[本]",
	"工物[本]",
	"航院[本]",
	"化工[本]",
	"材料[本]",
	"数学[本]",
	"物理[本]",
	"化学[本]",
	"生命学院[本]",
	"经管[本]",
	"人文社科[本]",
	"法学[本]",
	"美院[本]",
	"医学院[本]",
	"软件[本]",
	"新闻[本]",
	"微电子所[本]",
	"建筑[研]",
	"土木[研]",
	"水利[研]",
	"环境学院[研]",
	"机械[研]",
	"精仪[研]",
	"热能[研]",
	"汽车[研]",
	"电机[研]",
	"电子[研]",
	"计算机[研]",
	"自动化[研]",
	"工物[研]",
	"航院[研]",
	"化工[研]",
	"材料[研]",
	"数学[研]",
	"物理[研]",
	"化学[研]",
	"生命学院[研]",
	"经管[研]",
	"公管[研]",
	"人文社科[研]",
	"法学[研]",
	"美院[研]",
	"核研院[研]",
	"微电子所[研]",
	"工业工程[研]",
	"医学院[研]",
	"软件[研]",
	"新闻[研]",
	"马院[研]",
	"教研院[研]",
	"交叉信息学院[研]",
	"地学中心[研]",
	"金融学院[研]",
	"高等研究院[研]"
    };
    //分团委为对应id
    //各系业务办为对应id+length
    
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
