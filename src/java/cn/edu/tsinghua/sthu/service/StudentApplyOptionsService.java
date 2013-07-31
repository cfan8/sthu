/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.dao.ApplyCommentDAO;
import cn.edu.tsinghua.sthu.dao.StudentApplyOptionsDAO;
import cn.edu.tsinghua.sthu.dao.AuthDAO;
import cn.edu.tsinghua.sthu.dao.UserDAO;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author xiaoyou
 */
public class StudentApplyOptionsService {
    private StudentApplyOptionsDAO studentApplyOptionsDAO;
    private ApplyCommentDAO applyCommentDAO;
    private AuthDAO authDAO;
    private UserDAO userDAO;
    
    @Transactional
    public StudentApplyOptionsEntity getStudentApplyOptionsEntityById(int applyId){
        StudentApplyOptionsEntity entity = getStudentApplyOptionsDAO().getStudentApplyOptionsById(applyId);
	return entity;
    }
    
    @Transactional
    public StudentApplyOptionsEntity createStudentApplyOptions(int applyid, int userid, int activityArea, String externalIntro, String externalOrganizationIntro,
    String securityPreparedness, String overseasIntro, String overseasOrganizationIntro, String overseasMaterial, int croomFlag, int croomType, int allowAdjust,int croomCapacity,
    String croomStartTime, String croomEndTime, int LEDFlag, String LEDContent, String LEDStartTime, String LEDEndTime, int outsideFlag, int activityLocation,
    String outsideBorrowDate, String outsideTimePeriod, int boardFlag, String boardMaterial, int boardSize, String BoardStartTime, String BoardEndTime,
    int publicityFlag, String publicityMaterials, int ticketFlag, int ticketNum, String ticketTime, String ticketLocation){
        StudentApplyOptionsEntity entity = new StudentApplyOptionsEntity();
        entity.setApplyId(applyid);
        entity.setApplyUserid(userid);
        entity.setActivityArea(activityArea);
        entity.setExternalIntro(externalIntro);
        entity.setExternalOrganizationIntro(externalOrganizationIntro);
        entity.setSecurityPreparedness(securityPreparedness);
        entity.setOverseasIntro(overseasIntro);
        entity.setOverseasOrganizationIntro(overseasOrganizationIntro);
        entity.setOverseasMaterial(overseasMaterial);
        entity.setCroomFlag(croomFlag);
        entity.setCroomType(croomType);
        entity.setAllowAdjust(allowAdjust);
        entity.setCroomCapacity(croomCapacity);
        entity.setCroomStartTime(croomStartTime);
        entity.setCroomEndTime(croomEndTime);
        entity.setLEDFlag(LEDFlag);
        entity.setLEDContent(LEDContent);
        entity.setLEDStartTime(LEDStartTime);
        entity.setLEDEndTime(LEDEndTime);
        entity.setOutsideFlag(outsideFlag);
        entity.setActivityLocation(activityLocation);
        entity.setOutsideBorrowDate(outsideBorrowDate);
        entity.setOutsideTimePeriod(outsideTimePeriod);
        entity.setBoardFlag(boardFlag);
        entity.setBoardMaterial(boardMaterial);
        entity.setBoardSize(boardSize);
        entity.setBoardStartTime(BoardStartTime);
        entity.setBoardEndTime(BoardEndTime);
        entity.setPublicityFlag(publicityFlag);
        entity.setPublicityMaterials(publicityMaterials);
        entity.setTicketFlag(ticketFlag);
        entity.setTicketNum(ticketNum);
        entity.setTicketTime(ticketTime);
        entity.setTicketLocation(ticketLocation);
        getStudentApplyOptionsDAO().saveStudentApplyOptionsEntity(entity);
        return entity;
    }
    
    @Transactional
    public StudentApplyOptionsEntity modifyStudentApplyOptions(int applyId, int userid, int activityArea, String externalIntro, String externalOrganizationIntro,
    String securityPreparedness, String overseasIntro, String overseasOrganizationIntro, String overseasMaterial, int croomFlag, int croomType, int allowAdjust,int croomCapacity,
    String croomStartTime, String croomEndTime, int LEDFlag, String LEDContent, String LEDStartTime, String LEDEndTime, int outsideFlag, int activityLocation,
    String outsideBorrowDate, String outsideTimePeriod, int boardFlag, String boardMaterial, int boardSize, String BoardStartTime, String BoardEndTime,
    int publicityFlag, String publicityMaterials, int ticketFlag, int ticketNum, String ticketTime, String ticketLocation){
        StudentApplyOptionsEntity entity = studentApplyOptionsDAO.getOptionsById(applyId);
        entity.setApplyUserid(userid);
        entity.setActivityArea(activityArea);
        entity.setExternalIntro(externalIntro);
        entity.setExternalOrganizationIntro(externalOrganizationIntro);
        entity.setSecurityPreparedness(securityPreparedness);
        entity.setOverseasIntro(overseasIntro);
        entity.setOverseasOrganizationIntro(overseasOrganizationIntro);
        entity.setOverseasMaterial(overseasMaterial);
        entity.setCroomFlag(croomFlag);
        entity.setCroomType(croomType);
        entity.setAllowAdjust(allowAdjust);
        entity.setCroomCapacity(croomCapacity);
        entity.setCroomStartTime(croomStartTime);
        entity.setCroomEndTime(croomEndTime);
        entity.setLEDFlag(LEDFlag);
        entity.setLEDContent(LEDContent);
        entity.setLEDStartTime(LEDStartTime);
        entity.setLEDEndTime(LEDEndTime);
        entity.setOutsideFlag(outsideFlag);
        entity.setActivityLocation(activityLocation);
        entity.setOutsideBorrowDate(outsideBorrowDate);
        entity.setOutsideTimePeriod(outsideTimePeriod);
        entity.setBoardFlag(boardFlag);
        entity.setBoardMaterial(boardMaterial);
        entity.setBoardSize(boardSize);
        entity.setBoardStartTime(BoardStartTime);
        entity.setBoardEndTime(BoardEndTime);
        entity.setPublicityFlag(publicityFlag);
        entity.setPublicityMaterials(publicityMaterials);
        entity.setTicketFlag(ticketFlag);
        entity.setTicketNum(ticketNum);
        entity.setTicketTime(ticketTime);
        entity.setTicketLocation(ticketLocation);
        studentApplyOptionsDAO.updateStudentApplyOptionsEntity(entity);
        return entity;
    }
    
    @Transactional
    public StudentApplyOptionsEntity getStudentApplyOptionsEntityByApplyId(int applyId){
        StudentApplyOptionsEntity options = studentApplyOptionsDAO.getOptionsById(applyId);
        if(options == null)
            return null;
        else
            return options;
    }
    
    /**
     * @return the studentApplyOptionsDAO
     */
    public StudentApplyOptionsDAO getStudentApplyOptionsDAO() {
        return studentApplyOptionsDAO;
    }

    /**
     * @param studentApplyOptionsDAO the studentApplyOptionsDAO to set
     */
    public void setStudentApplyOptionsDAO(StudentApplyOptionsDAO studentApplyOptionsDAO) {
        this.studentApplyOptionsDAO = studentApplyOptionsDAO;
    }
    
    
}
