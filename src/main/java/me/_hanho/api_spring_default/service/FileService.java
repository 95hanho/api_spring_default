package me._hanho.api_spring_default.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {

	void fileUpload(MultipartFile file, String id);

	String getOriginalFile(String id);

	String getStoredFile(String id);

}
