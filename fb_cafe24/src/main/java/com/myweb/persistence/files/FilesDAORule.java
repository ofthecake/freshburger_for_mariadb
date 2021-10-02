package com.myweb.persistence.files;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.domain.FilesVO;

public interface FilesDAORule {
	public int insert(FilesVO fvo);
	public List<FilesVO> selectList(int pno);
	public List<FilesVO> selectList();
	public int delete(int pno);
}
