/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import java.util.List;
import org.hibernate.criterion.Restrictions;
/**
 *
 * @author elsie
 */
public class AuthDAO extends BaseDAO<AuthEntity>{
    public AuthDAO(){
        super(AuthEntity.class);
    }
    public List<AuthEntity> getAuthByIdentityType(int identityType){
        List<AuthEntity> list = select().add(Restrictions.eq("opIdentityCode", identityType)).list();
        return list;
    }
    public List<AuthEntity> getAuthByResourceType(int resourceType){
        List<AuthEntity> list = select().add(Restrictions.eq("opResourceCode", resourceType)).list();
        return list;
    }
    public List<AuthEntity> getAuthByAllocateType(int allocateType){
        List<AuthEntity> list = select().add(Restrictions.eq("opAllocateCode", allocateType)).list();
        return list;
    }
    
}
