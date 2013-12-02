/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.FollowGroupInBatchPageMessage;
import cn.edu.tsinghua.sthu.service.UserService;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author anna
 */
public class FollowGroupInBatchPageAction extends BaseAction{
    private UserService userService;
    private FollowGroupInBatchPageMessage followGroupInBatchPageMessage;
    private List<Boolean> batchList;
    private String batchListString;
    private int  groupID;
    private Integer doFollow;
    @Override
    public String onExecute() throws Exception {
       if( followGroupInBatchPageMessage == null){
            followGroupInBatchPageMessage = new  FollowGroupInBatchPageMessage();
       }
        getFollowGroupInBatchPageMessage().setAllGroups(getUserService().getAllGroups( ));
        if(batchListString != null){
            setBatchList(batchListString);
        for(int k=0;k<batchList.size();k++){
            if(batchList.get(k)==true){
                getUserService().followGroup(getCurrentUser(),getUserService().getAllGroups( ).get(k) );
            }
        }
        }
        if(groupID != -1){
            if(doFollow == 1){
              
                getUserService().followGroupByID(getCurrentUser(), groupID);
            }
            else if(doFollow == 0){
                 getUserService().unfollowGroupByID(getCurrentUser(), groupID);
            }
        }
        getFollowGroupInBatchPageMessage().setGroupsFollowNum(getUserService().getFollowedGroupsFollowNumbers(getUserService().getAllGroups( )));
        getFollowGroupInBatchPageMessage().setIsFollowed(getUserService().checkAllGroupFollowedByUser(getCurrentUser(),getUserService().getAllGroups( )));
        return SUCCESS;
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
     * @return the userService
     */
    public UserService getUserService() {
        return userService;
    }

    /**
     * @param userService the userService to set
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * @return the followGroupInBatchPageMessage
     */
    public FollowGroupInBatchPageMessage getFollowGroupInBatchPageMessage() {
        return followGroupInBatchPageMessage;
    }

    /**
     * @param followGroupInBatchPageMessage the followGroupInBatchPageMessage to set
     */
    public void setFollowGroupInBatchPageMessage(FollowGroupInBatchPageMessage followGroupInBatchPageMessage) {
        this.followGroupInBatchPageMessage = followGroupInBatchPageMessage;
    }

    /**
     * @return the batchList
     */
    public List<Boolean> getBatchList() {
        return batchList;
    }



    /**
     * @param batchList the batchList to set
     */
    public void setBatchList(String batchListString) {
        //this.batchList = batchList;
        String[] str = batchListString.split(",");
       this.batchList = new ArrayList<Boolean>();
       for(int i=0;i<str.length;i++){
           int temp = Integer.parseInt(str[i]);
         //  Integer.getInteger(str[i]);
           if(temp == 1) {
               this.batchList.add(true);
           }
           else {
               this.batchList.add(false);
           }
       }
    }

    /**
     * @return the batchListString
     */
    public String getBatchListString() {
        return batchListString;
    }

    /**
     * @param batchListString the batchListString to set
     */
    public void setBatchListString(String batchListString) {
        this.batchListString = batchListString;
    }

    /**
     * @return the group
     */
    public int getGroupID() {
        return groupID;
    }

    /**
     * @param group the group to set
     */
    public void setGroupID(int groupID) {
        this.groupID = groupID;
    }

    /**
     * @return the doFollow
     */
    public Integer getDoFollow() {
        return doFollow;
    }

    /**
     * @param doFollow the doFollow to set
     */
    public void setDoFollow(Integer doFollow) {
        this.doFollow = doFollow;
    }


    
}
