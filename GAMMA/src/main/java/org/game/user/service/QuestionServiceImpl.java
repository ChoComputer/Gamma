package org.game.user.service;

import java.util.List;

import org.game.user.domain.QuestionSearchCriteria;
import org.game.user.domain.QuestionVO;
import org.game.user.mapper.AnswerMapper;
import org.game.user.mapper.QuestionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionMapper mapper;

	@Autowired
	private AnswerMapper amapper;
	
	@Override
	public int adminOrNot(String cid) {
		log.info("관리자 여부 확인");
		return mapper.getAdmin(cid);
	}

	@Override
	public void addQuestion(QuestionVO vo) {
		log.info("질문글 추가 실행");
		mapper.insertQuestion(vo);
	}
/*
	@Override
	public List<QuestionVO> questionList(String qwriter) {
		log.info("질문글 목록 조회");
		return mapper.getQuestionList(qwriter);
	}
*/
	@Override
	public List<QuestionVO> questionListP(QuestionSearchCriteria cri, String qwriter) {
		log.info("페이징 처리된 질문글 목록 조회");
		log.info("service 에서 cri 확인:" + cri);
		return mapper.getQuestionListP(cri, qwriter);
	}
	
	@Override
	public int countQuestion(QuestionSearchCriteria cri, String qwriter) {
		log.info("질문글 목록 개수 조회");
		return mapper.getCountQuestion(cri, qwriter);
	}

	@Override
	public List<QuestionVO> typeQuestion(String qtype) {
		log.info("타입별 질문글 목록 조회");
		return mapper.getQtypeQuestion(qtype);
	}

	@Override
	public int countQtype(String qtype) {
		log.info("타입별 질문글 목록 개수 조회");
		return mapper.getCountQtype(qtype);
	}

	@Override
	public QuestionVO ownQuestion(int qnum) {
		log.info("본인 단일 질문글 조회");
		return mapper.getOwnQuestion(qnum);
	}

	@Override
	public void modifyQuestion(QuestionVO vo) {
		log.info("질문글 수정");
		mapper.updateQuestion(vo);
	}

	@Override
	public void removeQuestion(int qnum) {
		log.info("질문글 삭제");
		// 답변을 먼저 삭제해야 부모인 질문글을 삭제할 수 있음 
		amapper.deleteQnA(qnum);
		mapper.deleteQuestion(qnum);
	}


}