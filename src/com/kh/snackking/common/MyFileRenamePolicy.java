package com.kh.snackking.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File oldFile) {
		
		long currentTime = System.currentTimeMillis();
		
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		int randomNumber = (int)(Math.random() * 1000000);
		
		String name = oldFile.getName();
		String body = "";
		String ext = "";
		
		int dot = name.lastIndexOf(".");
		if(dot != -1) {
			body = name.substring(0, dot);
			ext = name.substring(dot);
		} else {
			body = name;
		}
		
		String fileName = ft.format(new Date(currentTime)) + randomNumber + ext;
		
		File newFile = new File(oldFile.getParent(), fileName);
		
		return newFile;
	}
	
}
