/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.Util;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.service.UserService;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author xiaobo
 */
public class BatchAddUserAction extends BaseAction{

    
    private String username;
    private String password;
    private String nickname;
    private UserService userService;
    
    @Override
    public String onExecute() throws Exception {
        String encoding = "UTF-8";
        File file = new File("C://Users//user//Desktop//社团.txt");
        BufferedReader reader = null;
        List<String> list = new ArrayList<String>();
        try{
            InputStreamReader read = new InputStreamReader(new FileInputStream(file), encoding);
            reader = new BufferedReader(read);
            String tempString = null;
            while((tempString = reader.readLine()) != null){
                list.add(tempString);
            }
            reader.close();
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            if(reader != null){
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        for(int i = 0; i < list.size(); i ++){
            
            if (getUserService().addUser("group" + String.valueOf(i + 1), "group" + String.valueOf(i + 1), list.get(i)))
            {
                
            }
            else{
                alertMessage.setAlertTitle("创建失败");
                alertMessage.setAlertContent("已有重名用户！");
                alertMessage.setAlertType(AlertMessage.ALERT_TYPE);
                alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
                return ALERT;
            }
        }
        alertMessage.setAlertTitle("创建成功");
                alertMessage.setAlertContent("创建成功，点击确定登录！");
                alertMessage.setAlertType(AlertMessage.BOX_TYPE);
                alertMessage.setRedirectURL("login.jsp");
	return ALERT;
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
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the nickname
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * @param nickname the nickname to set
     */
    public void setNickname(String nickname) {
        this.nickname = nickname;
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
    
}
