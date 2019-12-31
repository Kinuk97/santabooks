package com.santabooks.file.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.santabooks.file.dto.FileVO;

public class DownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// 모델값 가져오기
		FileVO file = (FileVO) model.get("downFile");
		
		// 서블릿 컨텍스트 얻기
		ServletContext context = request.getSession().getServletContext();
		
		// 업로드된 실제 파일에 대한 객체 얻기
		File src = new File(context.getRealPath("upload"), file.getStoredName());
		
		// ContentType 설정
		// 이진 데이터 (application/octet-stream) 형식으로 응답 설정
		// 브라우저는 응답 받은 데이터의 형식이 어떤 형태를 가지는지 알 수 없게되어 무조건 다운받아버린다.
		response.setContentType("application/octet-stream");
		
		// 응답 데이터의 크기 설정
		response.setContentLength((int) src.length());
		
		// 응답 데이터의 인코딩 설정
		response.setCharacterEncoding("UTF-8");
		
		// 클라이언트가 저장할 때 사용할 파일 이름에 대한 인코딩 설정
		// replace는 띄어쓰기가 +로 나와서 바꿔주는 작업
		String outputName = URLEncoder.encode(file.getOriginName(), "UTF-8").replace("+", "%20");
		
		// 브라우저가 다운로드에 사용할 이름 설정
		response.setHeader("Content-Disposition", "attachement; filename=\"" + outputName + "\"");
		
		// 응답 (브라우저로 출력)
		// 서버의 File -> FileInputStream -> OutputStream으로 출력

		// 서버의 파일 입력 스트림
		FileInputStream fis = new FileInputStream(src);
		// 서버의 응답 출력 스트림
		OutputStream out = response.getOutputStream();
		
		// 서버 -> 클라이언트 복사 (출력)
		FileCopyUtils.copy(fis, out);
		// 출력 버퍼 비우기
		out.flush();
		
		// 스트림 닫기
		fis.close();
		out.close();
		
	}

}
