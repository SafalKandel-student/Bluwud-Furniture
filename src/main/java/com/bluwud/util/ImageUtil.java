package com.bluwud.util;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class ImageUtil {

	public String getImageNameFromPart(Part part) {
		
		String contentDisp = part.getHeader("content-disposition");

		
		String[] items = contentDisp.split(";");

		String imageName = null;

		for (String s : items) {
			if (s.trim().startsWith("filename")) {

				imageName = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}

		if (imageName == null || imageName.isEmpty()) {

			imageName = "download.png";
		}

		return imageName;
	}


	public boolean uploadImage(Part part, String saveFolder, HttpServletRequest request) {

	    String uploadDir = "C:/Users/ACER/eclipse-workspace/Bluwud-Furniture/src/main/webapp/resources/images/" + saveFolder;
	    File fileSaveDir = new File(uploadDir);

	    if (!fileSaveDir.exists() && !fileSaveDir.mkdirs()) {
	        return false; 
	    }

	    try {
	        String imageName = getImageNameFromPart(part);
	        part.write(uploadDir + File.separator + imageName);
	        return true;
	    } catch (IOException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	
	
	public String getSavePath(String saveFolder) {
		return "C:/Users/ACER/eclipse-workspace/Bluwud-Furniture/src/main/webapp/resources/images/products"+saveFolder+"/";
	}
}
