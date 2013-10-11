/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

/**
 *
 * @author xiaobo
 */
public class ShowInserUserAction extends BaseAction{

    @Override
    public String onExecute() throws Exception {
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        return true;
    }
    
    @Override
    public boolean hasAuth(){
        if(getCurrentUser().getAuth().getOpUserCode() > 0)
            return true;
        return false;
    }

    @Override
    public boolean needLogin() {
        return true;
    }
    
}
