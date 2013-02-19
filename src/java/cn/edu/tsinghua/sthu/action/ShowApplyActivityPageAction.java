/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.ActivityApplyEntity;

import cn.edu.tsinghua.sthu.service.ApplyActivityService;
import java.text.SimpleDateFormat;

/**
 *
 * @author luzhen
 */
public class ShowApplyActivityPageAction extends BaseAction{
    public static final String RETURN_CREATE = "create";
    public static final String RETURN_MODIFY = "modify";
    
    private Integer applyId;
    

    private ApplyActivityService applyActivityService;
    
    @Override
    public String onExecute() {
	if (getApplyId() != null)
	{
	    ActivityApplyEntity entity = getApplyActivityService().getActivityApplyEntityById(getApplyId(), getCurrentUser().getID());
	    if (entity == null)
	    {
		alertMessage.setSimpleAlert("无法编辑指定的教室申请！");
		return ALERT;
	    }
	    else
	    {
//		showApplyClassroomPageMessage.setModify(true);
//		showApplyClassroomPageMessage.setApplyEntity(entity);
		return RETURN_MODIFY;
	    }
	}
	else
	{
//	    showApplyClassroomPageMessage.setModify(false);
	    return RETURN_CREATE;
	}
    }

    @Override
    public boolean hasAuth(){
	if (getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE) {
	    return false;
	}
	else
	{
	    return true;
	}
    }
    
    @Override
    public boolean valid() {
	return true;
    }

    @Override
    public boolean needLogin() {
	return true;
    }

    public Integer getApplyId() {
        return applyId;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public ApplyActivityService getApplyActivityService() {
        return applyActivityService;
    }

    public void setApplyActivityService(ApplyActivityService applyActivityService) {
        this.applyActivityService = applyActivityService;
    }
    
}
