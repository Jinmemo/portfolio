package odi_project.common.model.dao;

import java.util.List;

import odi_project.common.model.vo.Image;

public interface ImageMapper {
	// 1. 조회수 상위 N개 이미지 리스트를 조회하는 쿼리
    List<Image> getTopRankedImages();
    List<String> getTravelImageUrls();
}