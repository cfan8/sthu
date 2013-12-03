/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
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
    private Integer[] chooseAll;
    
    @Override
    public String onExecute() throws Exception {
       if( followGroupInBatchPageMessage == null){
            followGroupInBatchPageMessage = new  FollowGroupInBatchPageMessage();
       }
        getFollowGroupInBatchPageMessage().setAllGroups(getUserService().getAllGroups( ));
         getFollowGroupInBatchPageMessage().setGroupsFollowNum(getUserService().getFollowedGroupsFollowNumbers(getUserService().getAllGroups( )));
        if(getCurrentUser() == null || getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE){
             getFollowGroupInBatchPageMessage().setShowFollowed(0);
        }
        else{
             getFollowGroupInBatchPageMessage().setShowFollowed(1);
          
                      
              if(chooseAll != null){
            for(int i=0;i<chooseAll.length;i++){
                 int index = chooseAll[i];
                 getUserService().followGroupByID(getCurrentUser(),index );
                       
                
            }
           
        }
     
       // getFollowGroupInBatchPageMessage().setGroupsFollowNum(getUserService().getFollowedGroupsFollowNumbers(getUserService().getAllGroups( )));
        getFollowGroupInBatchPageMessage().setIsFollowed(getUserService().checkAllGroupFollowedByUser(getCurrentUser(),getUserService().getAllGroups( )));
        }
     
        return SUCCESS;
    }
   @Override
    public boolean hasAuth(){
      
        return true;
    }
    
    @Override
    public boolean valid() {
       return true;
    }

    @Override
    public boolean needLogin() {
        return false;
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
     * @return the chooseAll
     */
    public Integer[] getChooseAll() {
        return chooseAll;
    }

    /**
     * @param chooseAll the chooseAll to set
     */
    public void setChooseAll(Integer[] chooseAll) {
        this.chooseAll = chooseAll;
    }


    
}
