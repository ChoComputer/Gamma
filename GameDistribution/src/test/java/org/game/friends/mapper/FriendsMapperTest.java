package org.game.friends.mapper;

import java.util.List;

import org.game.friends.domain.FriendsVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FriendsMapperTest {
	@Autowired
	private FriendsMapper mapper;
	
	//@Test 됨 
	public void testGetUser() {
		log.info(mapper.getUser("abc"));
	}
	
	//@Test 됨 
	public void testInsertFriend() {
		FriendsVO vo = new FriendsVO();
		vo.setFollower("htrew");
		vo.setFollowing("gnmb");
		mapper.insertFriend(vo);
	}
	
	//@Test 됨
	public void testGetFollower() {
		mapper.getFollower("asfgd", "dv");
	}
	
	//@Test 됨 
	@Test
	public void testGetFollowing() {
		mapper.getFollowing("asfgd", "bc");
	}
	
	//@Test 됨
	public void testDeleteFriend() {
		mapper.deleteFriend("excfnjg", "htrew");
	}
}
