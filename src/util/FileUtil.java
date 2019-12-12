package util;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FileUtil {

	public static String rename(String fileName) {
		String nameFile = "";
		if (!fileName.isEmpty()) {
			String[] arrImg = fileName.split("\\.");
			String duoiFileImg = arrImg[arrImg.length - 1];
			
			for (int i = 0; i < (arrImg.length - 1); i++) {
				if (i == 0) {
					nameFile = arrImg[i];
				} else {
					nameFile += "-" + arrImg[i];
				}
			}
			nameFile = nameFile + "-" + System.nanoTime() + "." + duoiFileImg;
		}
		return nameFile;
	}

	public static String getName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
	public static String uploadFile(HttpServletRequest request,String inputFileName,String dirUpload) throws IOException, ServletException {
		final Part part = request.getPart(inputFileName);
		String fileName=FileUtil.rename(part.getSubmittedFileName());
		if (!"".equals(fileName)) { //có upload file
			// đường dẫn luu file--phải là đường dẫn tuyệt đối
			String filePath = request.getServletContext().getRealPath("")+dirUpload;
			File dirPath = new File(filePath);//tạo đường dẫn chứa file
			if (!dirPath.exists()) {//nếu chưa tồn tại
				dirPath.mkdirs();//tạo ra
			}
			// ghi file
			filePath = filePath + File.separator + fileName;
			System.out.println(filePath);
			part.write(filePath);
		}
		return fileName;
	}

}
