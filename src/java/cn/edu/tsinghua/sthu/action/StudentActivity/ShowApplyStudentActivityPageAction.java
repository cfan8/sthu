/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
import cn.edu.tsinghua.sthu.message.outdoor.ShowApplyActivityPageMessage;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowApplyStudentActivityPageMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import cn.edu.tsinghua.sthu.service.StudentApplyOptionsService;
import java.text.SimpleDateFormat;
/**
 *
 * @author xiaobo
 */
public class ShowApplyStudentActivityPageAction extends BaseAction{
    public static final String RETURN_CREATE = "create";
    public static final String RETURN_MODIFY = "modify";
    public static final String RETURN_GROUP_CREATE = "group_create";
    
    private Integer applyId;
    private ShowApplyStudentActivityPageMessage showApplyStudentActivityPageMessage;
    private ApplyStudentActivityService applyStudentActivityService;
    private StudentApplyOptionsService studentApplyOptionsService;
    
    @Override
    public String onExecute() {
	if (getApplyId() != null)
	{
            StudentActivityApplyEntity entity;
            if(getCurrentUser().getAuth().getOpGroupCode() == -1){
                entity = getApplyStudentActivityService().getStudentActivityApplyEntityById(getApplyId(), getCurrentUser().getID());
            }else{
                entity = getApplyStudentActivityService().getStudentActivityApplyEntityById(getApplyId());
            }
            StudentApplyOptionsEntity options = entity.getOption();
	    if (entity == null)
	    {
		alertMessage.setSimpleAlert("无法编辑指定的活动申请！");
		return ALERT;
	    }
	    else
	    {
                if(getCurrentUser().getAuth().getRole() == AuthEntity.USER_ROLE){
                    getShowApplyStudentActivityPageMessage().setApplyType(ShowApplyStudentActivityPageMessage.USER_APPLY);
                    getShowApplyStudentActivityPageMessage().setApplyUserNickname(getCurrentUser().getNickname());
                }else if(getCurrentUser().getAuth().getRole() == AuthEntity.GROUP_ROLE){
                    getShowApplyStudentActivityPageMessage().setApplyType(ShowApplyStudentActivityPageMessage.GROUP_APPLY);
                    getShowApplyStudentActivityPageMessage().setOrganizerName(getCurrentUser().getNickname());
                    getShowApplyStudentActivityPageMessage().setApplyUserNickname(entity.getApplicantName());
                }else if(getCurrentUser().getAuth().getOpGroupCode() != -1){
                    getShowApplyStudentActivityPageMessage().setShowProcess(false);
                }
		getShowApplyStudentActivityPageMessage().setStudentActivityApplyEntity(entity);
		
                getShowApplyStudentActivityPageMessage().setStudentApplyOptionsEntity(options);
		return RETURN_MODIFY;
	    }
	}
	else
	{
            if(getCurrentUser().getAuth().getRole() == AuthEntity.USER_ROLE){
                getShowApplyStudentActivityPageMessage().setApplyUserNickname(getCurrentUser().getNickname());
                return RETURN_CREATE;
            }else{
                getShowApplyStudentActivityPageMessage().setOrganizerName(getCurrentUser().getNickname());
                return RETURN_GROUP_CREATE;
            }   
	}
    }
    
    @Override
    public boolean hasAuth(){
	if (getCurrentUser().getAuth().getRole() == AuthEntity.USER_ROLE || getCurrentUser().getAuth().getRole() == AuthEntity.GROUP_ROLE || getCurrentUser().getAuth().getOpGroupCode() != -1) {
	    return true;
	}
	else
	{
	    return false;
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

    /**
     * @return the applyId
     */
    public Integer getApplyId() {
        return applyId;
    }

    /**
     * @param applyId the applyId to set
     */
    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    /**
     * @return the showApplyStudentActivityPageMessage
     */
    public ShowApplyStudentActivityPageMessage getShowApplyStudentActivityPageMessage() {
        return showApplyStudentActivityPageMessage;
    }

    /**
     * @param showApplyStudentActivityPageMessage the showApplyStudentActivityPageMessage to set
     */
    public void setShowApplyStudentActivityPageMessage(ShowApplyStudentActivityPageMessage showApplyStudentActivityPageMessage) {
        this.showApplyStudentActivityPageMessage = showApplyStudentActivityPageMessage;
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
     * @return the studentApplyOptionsService
     */
    public StudentApplyOptionsService getStudentApplyOptionsService() {
        return studentApplyOptionsService;
    }

    /**
     * @param studentApplyOptionsService the studentApplyOptionsService to set
     */
    public void setStudentApplyOptionsService(StudentApplyOptionsService studentApplyOptionsService) {
        this.studentApplyOptionsService = studentApplyOptionsService;
    }

    
}
