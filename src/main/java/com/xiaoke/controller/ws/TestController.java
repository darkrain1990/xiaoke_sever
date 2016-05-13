package com.xiaoke.controller.ws;

import com.xiaoke.entity.Message;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


/**
 * 测试接口
 */
@RestController
@RequestMapping("/rest")
public class TestController {



    @RequestMapping("test")
    public Message test(@RequestParam("userName") String userName){
        Message msg = new Message();
        msg.setSendType('C');
        msg.setSendDate("2016-03-05");
        msg.setSendContent("balabala");
        return msg;
    }


	
}




