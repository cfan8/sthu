/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.FollowEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;


/**
 *
 * @author user
 */
public class FollowDAO extends BaseDAO<FollowEntity> {
    public  FollowDAO(){
        super(FollowEntity.class);
    }
    public void addFollowGroup(int userID, int groupID){
        FollowEntity follow = new FollowEntity();
        follow.setUserID(userID);
        follow.setGroupID(groupID);
        follow.setFollowType(FollowEntity.FOLLOW_TYPE_GROUP);
        insert(follow);
    }
    public void cancelFollowGroup(int userID, int groupID){
        List<FollowEntity> list = select().add(
                Restrictions.and(
                Restrictions.eq("userID", userID),
                Restrictions.eq("followType", FollowEntity.FOLLOW_TYPE_GROUP),
                Restrictions.eq("groupID", groupID))).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();;
        for (FollowEntity f : list) {
            delete(f);
        }
    }
    public void addFollowActivity(int userID, int activityID){
        FollowEntity follow = new FollowEntity();
        follow.setUserID(userID);
        follow.setActivityID(activityID);
        follow.setFollowType(FollowEntity.FOLLOW_TYPE_ACTIVITY);
        insert(follow); 
    }
    public void cancelFollowActivity(int userID, int activityID){
        List<FollowEntity> list = select().add(
                Restrictions.and(
                Restrictions.eq("userID", userID),
                Restrictions.eq("followType", FollowEntity.FOLLOW_TYPE_ACTIVITY),
                Restrictions.eq("activityID", activityID))).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();;
        for (FollowEntity f : list) {
            delete(f);
        }
    }
    public List<FollowEntity> getFollowGroupByUserId(int userID){
        List<FollowEntity> list = select().add(
                Restrictions.and(
                Restrictions.eq("userID", userID),
                Restrictions.eq("followType", FollowEntity.FOLLOW_TYPE_GROUP))).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();;
        return list;
    }
    public List<FollowEntity> getFollowActivityByUserId(int userID){
        List<FollowEntity> list = select().add(
                Restrictions.and(
                Restrictions.eq("userID", userID),
                Restrictions.eq("followType", FollowEntity.FOLLOW_TYPE_ACTIVITY))).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();;
        return list;
    }
    public boolean isGroupFollowedByUser(int userID, int groupID){
        List<FollowEntity> list = select().add(
                Restrictions.and(Restrictions.eq("userID", userID),
                Restrictions.eq("groupID", groupID), Restrictions.eq("followType", FollowEntity.FOLLOW_TYPE_GROUP))
                ).list();
        if(list.size() == 0)
            return false;
        else
            return true;
    }
    public boolean isActivityFollowedByUser(int userID, int activityID){
        List<FollowEntity> list = select().add(
                Restrictions.and(Restrictions.eq("userID", userID),
                Restrictions.eq("activityID", activityID), Restrictions.eq("followType", FollowEntity.FOLLOW_TYPE_ACTIVITY))
                ).list();
        if(list.size() == 0)
            return false;
        else
            return true;
    }
    public int getFollowedNumberByActivityId(int activityID){
        Object r = select().add(Restrictions.and(
                Restrictions.eq("activityID", activityID),
                Restrictions.eq("followType", FollowEntity.FOLLOW_TYPE_ACTIVITY)))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }
}
