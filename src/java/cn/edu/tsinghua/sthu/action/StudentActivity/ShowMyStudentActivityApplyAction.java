/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowMyStudentActivityApplyMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;

/**
 *
 * @author xiaobo
 */
public class ShowMyStudentActivityApplyAction extends BaseAction{

    private int type = 0;
    private ShowMyStudentActivityApplyMessage showMyStudentActivityApplyMessage;
    private ApplyStudentActivityService applyStudentActivityService;
    @Override
    public String onExecute() throws Exception {
        getShowMyStudentActivityApplyMessage().setType(type);
        getShowMyStudentActivityApplyMessage().setTotalPageNumber(getApplyStudentActivityService().getMyApplyTotalPageNumber(getCurrentUser().getID(), 5));
        return SUCCESS;
    }

    @Override
    public boolean hasAuth(){
        if (getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE && getCurrentUser().getAuth().getRole() != AuthEntity.GROUP_ROLE) {
	    return false;
	}
	else {
	    return true;
	}
    }
    
    @Override
    public boolean valid() {
        if(getType() != 0 && getType() != 1)
            return false;
        return true;
    }

    @Override
    public boolean needLogin() {
       return true;
    }

    /**
     * @return the showMyStudentActivityApplyMessage
     */
    public ShowMyStudentActivityApplyMessage getShowMyStudentActivityApplyMessage() {
        return showMyStudentActivityApplyMessage;
    }

    /**
     * @param showMyStudentActivityApplyMessage the showMyStudentActivityApplyMessage to set
     */
    public void setShowMyStudentActivityApplyMessage(ShowMyStudentActivityApplyMessage showMyStudentActivityApplyMessage) {
        this.showMyStudentActivityApplyMessage = showMyStudentActivityApplyMessage;
    }

    /**
     * @return the applyStudentActivityService
     */
    public ApplyStudentActivityService getApplyStudentActivityService() {
        return applyStudentActivityService;
    }

    /**
     * @param applyStudentActivityService the applyStudentActivityService to set
     */
    public void setApplyStudentActivityService(ApplyStudentActivityService applyStudentActivityService) {
        this.applyStudentActivityService = applyStudentActivityService;
    }

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(int type) {
        this.type = type;
    }
    
}
