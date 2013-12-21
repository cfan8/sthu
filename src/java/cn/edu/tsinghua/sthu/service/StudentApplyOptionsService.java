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
    
//    @Transactional
//    public StudentApplyOptionsEntity getStudentApplyOptionsEntityById(int applyId){
//        StudentApplyOptionsEntity entity = getStudentApplyOptionsDAO().getStudentApplyOptionsById(applyId);
//	return entity;
//    }
    
    @Transactional
    public StudentApplyOptionsEntity createStudentApplyOptions(int userid, int externalFlag, String externalIntro, String externalOrganizationIntro,
    String securityPreparedness, int overseasFlag, String overseasIntro, String overseasOrganizationIntro, String overseasMaterial, int croomFlag, int croomType, int allowAdjust,int croomCapacity,
    int croomWeek, String croomClassTime, String HDSJ, String croomStartTime, String croomEndTime, int LEDFlag, String LEDContent, String LEDStartTime, String LEDEndTime, int outsideFlag, int activityLocation,
    String outsideBorrowDate, String outsideTimePeriod, int boardFlag, String boardMaterial, int boardSize, int boardNum, String BoardStartTime, String BoardEndTime, 
    int bulletinFlag, int bulletinArea, String bulletinIndex, String bulletinApplyReason, String bulletinPoster,
    int publicityFlag, String publicityMaterials, String mainImg, int ticketFlag, int ticketNum, Date ticketRandomDate, String ticketTime, String ticketLocation){
        StudentApplyOptionsEntity entity = new StudentApplyOptionsEntity();
        entity.setApplyUserid(userid);
        entity.setExternalFlag(externalFlag);
        entity.setExternalIntro(externalIntro);
        entity.setExternalOrganizationIntro(externalOrganizationIntro);
        entity.setSecurityPreparedness(securityPreparedness);
        entity.setOverseasFlag(overseasFlag);
        entity.setOverseasIntro(overseasIntro);
        entity.setOverseasOrganizationIntro(overseasOrganizationIntro);
        entity.setOverseasMaterial(overseasMaterial);
        entity.setCroomFlag(croomFlag);
        entity.setCroomType(croomType);
        entity.setAllowAdjust(allowAdjust);
        entity.setCroomCapacity(croomCapacity);
        entity.setCroomWeek(croomWeek);
        entity.setCroomClassTime(croomClassTime);
        entity.setHDSJ(HDSJ);
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
        entity.setBoardNum(boardNum);
        entity.setBoardStartTime(BoardStartTime);
        entity.setBoardEndTime(BoardEndTime);
        entity.setBulletinFlag(bulletinFlag);
        entity.setBulletinArea(bulletinArea);
        entity.setBulletinIndex(bulletinIndex);
        entity.setBulletinApplyReason(bulletinApplyReason);
        entity.setBulletinPoster(bulletinPoster);
        entity.setPublicityFlag(publicityFlag);
        entity.setPublicityMaterials(publicityMaterials);
        entity.setPublicityImg(mainImg);
        entity.setTicketFlag(ticketFlag);
        entity.setTicketNum(ticketNum);
        entity.setTicketRandomDate(ticketRandomDate);
        entity.setTicketTime(ticketTime);
        entity.setTicketLocation(ticketLocation);
        //getStudentApplyOptionsDAO().saveStudentApplyOptionsEntity(entity);
        return entity;
    }
    
    @Transactional
    public StudentApplyOptionsEntity modifyStudentApplyOptions(int userid, int externalFlag, String externalIntro, String externalOrganizationIntro,
    String securityPreparedness, int overseasFlag, String overseasIntro, String overseasOrganizationIntro, String overseasMaterial, int croomFlag, int croomType, int allowAdjust,int croomCapacity,
    int croomWeek, String croomClassTime, String HDSJ, String croomStartTime, String croomEndTime, int LEDFlag, String LEDContent, String LEDStartTime, String LEDEndTime, int outsideFlag, int activityLocation,
    String outsideBorrowDate, String outsideTimePeriod, int boardFlag, String boardMaterial, int boardSize, int boardNum, String BoardStartTime, String BoardEndTime,
    int bulletinFlag, int bulletinArea, String bulletinIndex, String bulletinApplyReason, String bulletinPoster,
    int publicityFlag, String publicityMaterials, String mainImg, int ticketFlag, int ticketNum, Date ticketRandomDate, String ticketTime, String ticketLocation, int optionId){
        StudentApplyOptionsEntity entity = studentApplyOptionsDAO.getStudentApplyOptionsById(optionId);
        entity.setApplyUserid(userid);
        entity.setExternalFlag(externalFlag);
        entity.setExternalIntro(externalIntro);
        entity.setExternalOrganizationIntro(externalOrganizationIntro);
        entity.setSecurityPreparedness(securityPreparedness);
        entity.setOverseasFlag(overseasFlag);
        entity.setOverseasIntro(overseasIntro);
        entity.setOverseasOrganizationIntro(overseasOrganizationIntro);
        entity.setOverseasMaterial(overseasMaterial);
        entity.setCroomFlag(croomFlag);
        entity.setCroomType(croomType);
        entity.setAllowAdjust(allowAdjust);
        entity.setCroomCapacity(croomCapacity);
        entity.setCroomWeek(croomWeek);
        entity.setCroomClassTime(croomClassTime);
        entity.setHDSJ(HDSJ);
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
        entity.setBoardNum(boardNum);
        entity.setBoardStartTime(BoardStartTime);
        entity.setBoardEndTime(BoardEndTime);
        entity.setBulletinFlag(bulletinFlag);
        entity.setBulletinArea(bulletinArea);
        entity.setBulletinIndex(bulletinIndex);
        entity.setBulletinApplyReason(bulletinApplyReason);
        entity.setBulletinPoster(bulletinPoster);
        entity.setPublicityFlag(publicityFlag);
        entity.setPublicityMaterials(publicityMaterials);
        entity.setPublicityImg(mainImg);
        entity.setTicketFlag(ticketFlag);
        entity.setTicketNum(ticketNum);
        entity.setTicketRandomDate(ticketRandomDate);
        entity.setTicketTime(ticketTime);
        entity.setTicketLocation(ticketLocation);
        //studentApplyOptionsDAO.updateStudentApplyOptionsEntity(entity);
        return entity;
    }
    
//    @Transactional
//    public StudentApplyOptionsEntity getStudentApplyOptionsEntityByApplyId(int applyId){
//        StudentApplyOptionsEntity options = studentApplyOptionsDAO.getOptionsById(applyId);
//        if(options == null)
//            return null;
//        else
//            return options;
//    }
    
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
