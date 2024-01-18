package odi_project.member.model.service;

import odi_project.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m); // 내부에 몸통 구현하면안됨, public abstract가 묵시적으로 붙음
}
