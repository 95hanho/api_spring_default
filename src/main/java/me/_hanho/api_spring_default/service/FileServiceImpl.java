package me._hanho.api_spring_default.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import io.jsonwebtoken.io.IOException;
import me._hanho.api_spring_default.repository.FileRepository;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileRepository fileDAO;
	
	@Override
	public String getOriginalFile(String id) {
		return fileDAO.getOriginalFile(id);
	}
	

	@Override
	public String getStoredFile(String id) {
		return fileDAO.getStoredFile(id);
	}

	
	@Override
	public void fileUpload(MultipartFile file, String id) {
		// 파일명 설정
		String originalFileName = file.getOriginalFilename();
		String storeFileName = System.currentTimeMillis() + "_" + originalFileName;
		
		String beforeFileName = getStoredFile(id);
		if(beforeFileName != null) {
			deleteFile(beforeFileName);
			fileDAO.fileUpdate(originalFileName, storeFileName, id);
		} else {
			fileDAO.fileInsert(originalFileName, storeFileName, id);
		}
		saveFile(file, storeFileName);
	}
	
	public boolean saveFile(MultipartFile file, String fileName) throws IOException {
		// 파일 저장
		try {
			// 클래스패스에서 "downloads" 폴더 경로 가져오기
	        ClassPathResource resource = new ClassPathResource("downloads/");
	        File downloadsDir = resource.getFile();
	        System.out.println("save downloadsDir : " + downloadsDir);

	        // 저장 경로 생성
	        File dest = new File(downloadsDir, fileName);
			
			file.transferTo(dest);
		} catch (IllegalStateException | java.io.IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean deleteFile(String fileName) throws IOException {
		try {
			// 클래스패스에서 "downloads" 폴더 경로 가져오기
	        ClassPathResource resource = new ClassPathResource("downloads/");
	        File downloadsDir = resource.getFile();
	        System.out.println("delete downloadsDir : " + downloadsDir);
	        
	        File file = new File(downloadsDir, fileName);
	        
	        // 파일 존재 여부 확인
	        if (file.exists()) {
	            // 파일 삭제
	            boolean deleted = file.delete();
	            if (deleted) {
	                System.out.println("파일 삭제 성공: " + fileName);
	            } else {
	                System.out.println("파일 삭제 실패: " + fileName);
	            }
	            return deleted;
	        } else {
	            System.out.println("파일이 존재하지 않습니다: " + fileName);
	            return false;
	        }
		} catch (java.io.IOException e) {
			e.printStackTrace();
			return false;
		}
       
	}


	
}