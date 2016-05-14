package com.xiaoke.wxapi.mapper;

import com.xiaoke.wxapi.core.page.Pagination;
import com.xiaoke.wxapi.domain.MsgNews;

import java.util.List;


public interface MsgNewsDao {

	public MsgNews getById(String id);

	public List<MsgNews> listForPage(MsgNews searchEntity);
	
	public List<MsgNews> pageWebNewsList(MsgNews searchEntity, Pagination<MsgNews> page);

	public void add(MsgNews entity);

	public void update(MsgNews entity);
	
	public void updateUrl(MsgNews entity);

	public void delete(MsgNews entity);

	public List<MsgNews> getRandomMsg(Integer num);

	public List<MsgNews> getRandomMsgByContent(String inputcode, Integer num);
	
	public List<MsgNews> getMsgNewsByIds(String[] array);

}