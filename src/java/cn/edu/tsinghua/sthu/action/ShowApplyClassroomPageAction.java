/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;
import cn.edu.tsinghua.sthu.message.ShowApplyClassroomPageMessage;
import cn.edu.tsinghua.sthu.service.ApplyClassroomService;
import java.text.SimpleDateFormat;

/**
 *
 * @author linangran
 */
public class ShowApplyClassroomPageAction extends BaseAction {

    public static final String RETURN_CREATE = "create";
    public static final String RETURN_MODIFY = "modify";
    
    private Integer applyId;
    
    private ShowApplyClassroomPageMessage showApplyClassroomPageMessage;
    private ApplyClassroomService applyClassroomService;
    
    @Override
    public String onExecute() {
	if (applyId != null)
	{
	    CRoomApplyEntity entity = applyClassroomService.getCRoomApplyEntityById(applyId, getCurrentUser().getID());
	    if (entity == null)
	    {
		alertMessage.setSimpleAlert("无法编辑指定的教室申请！");
		return ALERT;
	    }
	    else
	    {
		showApplyClassroomPageMessage.setModify(true);
		showApplyClassroomPageMessage.setApplyEntity(entity);
		return RETURN_MODIFY;
	    }
	}
	else
	{
	    showApplyClassroomPageMessage.setModify(false);
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

    public int getApplyId() {
	return applyId;
    }

    public void setApplyId(int applyId) {
	this.applyId = applyId;
    }

    public ShowApplyClassroomPageMessage getShowApplyClassroomPageMessage() {
	return showApplyClassroomPageMessage;
    }

    public void setShowApplyClassroomPageMessage(ShowApplyClassroomPageMessage showApplyClassroomPageMessage) {
	this.showApplyClassroomPageMessage = showApplyClassroomPageMessage;
    }

    public ApplyClassroomService getApplyClassroomService() {
	return applyClassroomService;
    }

    public void setApplyClassroomService(ApplyClassroomService applyClassroomService) {
	this.applyClassroomService = applyClassroomService;
    }
    
}
