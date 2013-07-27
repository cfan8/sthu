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
    public StudentApplyOptionsEntity createStudentApplyOptions(int userid, int activityArea, String externalIntro, String externalOrganizationIntro,
    String securityPreparedness, String overseasIntro, String overseasOrganizationIntro, String overseasMaterial){
        StudentApplyOptionsEntity entity = new StudentApplyOptionsEntity();
        entity.setApplyUserid(userid);
        entity.setActivityArea(activityArea);
        entity.setExternalIntro(externalIntro);
        entity.setExternalOrganizationIntro(externalOrganizationIntro);
        entity.setSecurityPreparedness(securityPreparedness);
        entity.setOverseasIntro(overseasIntro);
        entity.setOverseasOrganizationIntro(overseasOrganizationIntro);
        entity.setOverseasMaterial(overseasMaterial);
        getStudentApplyOptionsDAO().saveStudentApplyOptionsEntity(entity);
        return entity;
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
