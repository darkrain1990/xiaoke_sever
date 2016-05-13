
package com.xiaoke.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/note")
public class MessageController {

	/***
	 * 列表查询  wuwenhui
	 * @return 
	 */
	@RequestMapping("/searchmess")
	public String querySMSCode(String nowPage,HttpServletRequest req,HttpServletResponse rep,Model model){
//		Map<String,Object> map = new HashMap<String,Object>();
//		String mobilephone = req.getParameter("mobilephone");
//		map.put("receive_phone",mobilephone);
//		int totalRows = ms.getMessCount(map);//总条数
//		int currentPage = 1;//当前页
//		if(nowPage!=""&&nowPage!=null){
//			currentPage = Integer.parseInt(nowPage);
//			map.put("page", (currentPage-1)*10);
//			map.put("rows", currentPage*10);
//		}else{
//			map.put("page", 0);
//			map.put("rows", 10);
//		}
//		int pagecount = totalRows%10==0?totalRows/10:totalRows/10 + 1;//总页数
//		List<Message> mlist = ms.querymessage(map);
//		model.addAttribute("mobilephone", mobilephone);
//		model.addAttribute("messageList", mlist);
//		model.addAttribute("currentPage", currentPage);
//		model.addAttribute("pagecount", pagecount);
		return "../loads/message";
	}
}