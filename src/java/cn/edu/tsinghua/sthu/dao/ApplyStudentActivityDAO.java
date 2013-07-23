/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author xiaobo
 */
public class ApplyStudentActivityDAO extends BaseDAO<StudentActivityApplyEntity>{
    public ApplyStudentActivityDAO(){
        super(StudentActivityApplyEntity.class);
    }
    public StudentActivityApplyEntity getStudentActivityApplyEntityById(int id){
        return queryById(id);
    }
    public StudentActivityApplyEntity saveStudentActivityApplyEntity(StudentActivityApplyEntity entity){
        insert(entity);
        return entity;
    }
    public StudentActivityApplyEntity updateStudentActivityApplyEntity(StudentActivityApplyEntity entity){
        update(entity);
        return entity;
    }
}
