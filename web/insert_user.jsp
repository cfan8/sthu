<%-- 
    Document   : insert_user
    Created on : 2013-10-11, 0:22:08
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加用户</title>
    </head>
    <body>
        <form action="insertUser.do" method="post">
        用户名：
        <input type="text" name="userAccountList"/>
        <br/>
        
        用户昵称：
        <input type="text" name="userlist"/>
        <br/>
        
        
        用户密码：
        <input type="text" name="userPasswordList"/>
        <br/>
        
        userrole:
        <input type="text" name="userrole" value="-1"/>
        <br/>
        
        allocate:
        <input type="text" name="opAllocateCode" value="-1"/>
        <br/>
        
        article:
        <input type="text" name="opArticleCode" value="-1"/>
        <br/>
        
        identity:
        <input type="text" name="opIdentityCode" value="-1"/>
        <br/>
        
        resource:
        <input type="text" name="opResourceCode" value="-1"/>
        <br/>
        
        group:
        <input type="text" name="opGroupCode" value="-1"/>
        <br/>
        
        publish:
        <input type="text" name="opPublishCode" value="-1"/>
        <br/>
        
        other:
        <input type="text" name="opOtherCode" value="-1"/>
        <br/>
        
        user:
        <input type="text" name="opUserCode" value="-1"/>
        <br/>
        
        grouptype:
        <input type="text" name="groupType" value="-1"/>
        <br/>
        
        <input type="submit"/>
        </form>
        
        
        修改密码
        <form action="changeUserPassword.do" method="post">
          用户名：
          <input type="text" name="editUserAccount"/>
          新密码：
          <input type="text" name="editUserPassword"/>
          
          <input type="submit"/>
          
        </form>
        
        修改用户昵称
        <form action="changeUserNickname.do" method="post">
            用户名：
        <input type="text" name="nickUserAccount"/>
            新用户昵称：
            <input type="text" name="nickUserNickname"/>
        <input type="submit"/>
        </form>
    </body>
</html>
