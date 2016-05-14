package com.xiaoke.controller.ws;

import com.xiaoke.entity.Message;
import com.xiaoke.entity.SysUsers;
import com.xiaoke.service.SysUsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


/**
 * 测试接口
 */
@RestController
@RequestMapping("/rest")
public class TestController {

    @Autowired
    private SysUsersService sysUsersService;

    @RequestMapping("test")
    public Message test(@RequestParam("userName") String userName){
        SysUsers users=new SysUsers();
        users.setLoginName(userName);
        users.setEnabled(0);
        users.setIssys(0);
        sysUsersService.addUser(users);
        Message msg = new Message();
        msg.setSendType('C');
        msg.setSendDate("2016-03-05");
        msg.setSendContent("balabala");
        return msg;
    }


	
}




