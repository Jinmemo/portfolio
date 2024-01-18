package odi_project.common.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import odi_project.common.model.dao.RandomByMemberAddressDAO;
import odi_project.common.model.vo.Image;
import odi_project.common.template.Template;




public class RandomByMemberAddressServiceImpl implements RandomByMemberAddressService {

    private RandomByMemberAddressDAO randomByMemberAddressDAO = new RandomByMemberAddressDAO();

    @Override
    public Image RandomByMemberAddress(String memberAddress) {
        SqlSession sqlSession = Template.getSqlSession();
        Image randomByMemberAddress = randomByMemberAddressDAO.getRandomByMemberAddressDAO(sqlSession, memberAddress);
        sqlSession.close();
        return randomByMemberAddress;
    }
}

