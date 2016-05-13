package com.xiaoke.wxapi.mapper;

import com.xiaoke.wxapi.domain.MsgBase;
import com.xiaoke.wxapi.domain.MsgNews;
import com.xiaoke.wxapi.domain.MsgText;

import java.util.List;


public interface MsgBaseDao {

	public MsgBase getById(String id);

	public List<MsgBase> listForPage(MsgBase searchEntity);

	public List<MsgNews> listMsgNewsByBaseId(String[] ids);
	
	public MsgText getMsgTextByBaseId(String id);
	
	public MsgText getMsgTextBySubscribe();
	
	public MsgText getMsgTextByInputCode(String inputcode);
	
	public void add(MsgBase entity);

	public void update(MsgBase entity);
	
	public void updateInputcode(MsgBase entity);

	public void delete(MsgBase entity);

}