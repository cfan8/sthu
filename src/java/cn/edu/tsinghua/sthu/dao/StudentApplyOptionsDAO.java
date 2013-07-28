/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.dao.BaseDAO;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import java.util.List;
/**
 *
 * @author john
 */
public class StudentApplyOptionsDAO extends BaseDAO<StudentApplyOptionsEntity>{
    
    public StudentApplyOptionsDAO(){
        super(StudentApplyOptionsEntity.class);
    }
    public StudentApplyOptionsEntity getOptionsById(int applyId){
        List<StudentApplyOptionsEntity> list = select().add(Restrictions.eq("applyId", applyId)).list();
        if(list.size() == 1){
            return list.get(0);
        }
        else 
            return null;
    }
    
    public StudentApplyOptionsEntity getStudentApplyOptionsById(int id){
        return queryById(id);
    }
    
    public StudentApplyOptionsEntity saveStudentApplyOptionsEntity(StudentApplyOptionsEntity entity){
        insert(entity);
        return entity;
    }
    
    public StudentApplyOptionsEntity updateStudentApplyOptionsEntity(StudentApplyOptionsEntity entity){
        update(entity);
        return entity;
    }
}
