package jin.controller.upload;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jin.base.util.ZipUtil;
import jin.model.Source;
import jin.service.source.SourceServiceI;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/yun")
public class YunFileController {
	
	
	@Autowired
	private SourceServiceI sourceService;
	
	@Value("${upload.directory}")
	private  String DIRECTORY ;
	
	@RequestMapping("/toyun")
	public String toUpload(Model model){
		model.addAttribute("sources", sourceService.selectList());
		return "back/yun/yun";
	}
	
	@RequestMapping("/upload")
	public @ResponseBody List<Source> upload(@RequestParam MultipartFile[] files,HttpServletRequest request){
		
		List<Source> uploadList = new ArrayList<Source>();
		
		String contextPath = request.getServletContext().getRealPath(DIRECTORY);
		
		String contextUrl = request.getContextPath()  + DIRECTORY;
		//upload file to disk
		for(MultipartFile file : files){
			if(file.isEmpty()) continue;
			String fileName = file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf("."));
			String extentionName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")); 
			String realName = fileName + extentionName;
			try {
				File dest = new File(contextPath + realName);
				//rename file if has a file existing that has same name
				int count = 0;
				while(dest.exists()){
					fileName = fileName + count++;
					realName = fileName + extentionName;
					dest = new File(contextPath + realName);
				}
				file.transferTo(dest);
			} catch (Exception e) {
				e.printStackTrace();
				continue;
			} 
			Source source = new Source(file.getOriginalFilename(),realName,file.getSize(),extentionName,contextUrl + "/" + realName);
			sourceService.add(source);
			uploadList.add(source);
		}
		
		
		return uploadList;
	}
	
	@RequestMapping("/download")
	public ResponseEntity<byte[]> download(Long[] id,HttpServletRequest request) throws Exception{
		try {
			
			//select resource
			List<Source> sources = sourceService.selectByID(id);
			
			HttpHeaders header = new HttpHeaders();
			header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			byte [] body = null;
			String filePath = request.getServletContext().getRealPath(DIRECTORY);
			if(sources.size() == 1){
				header.setContentDispositionFormData("attachment",new String( sources.get(0).getName().getBytes("utf-8"),"iso-8859-1"));
		
				body = FileUtils.readFileToByteArray(new File(filePath + sources.get(0).getRealName()));
			}else {
				header.setContentDispositionFormData("attachment",new String( (new Date().getTime()+".zip").getBytes(),"iso-8859-1"));
				ByteArrayOutputStream outStream = new ByteArrayOutputStream();
				File[] files = new File[sources.size()];
				for(int i =0;i<sources.size();i++){
					files[i] = new File(filePath + sources.get(i).getRealName());
				}
				ZipUtil.zip(files, outStream);
				body = outStream.toByteArray();
			}
			
			
			return new ResponseEntity<byte[]>(body, header, HttpStatus.OK);
		} catch (Exception e) {
			throw new Exception(e);
		}
		
	}
	
	@RequestMapping("/rename")
	@ResponseBody
	public String rename(Long id,String newName){
		try {
			Source source = sourceService.selectById(id);
			source.setName(newName);
			sourceService.update(source);
			return "0";
		} catch (Exception e) {
			return "1";
		}
		
	}
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Long [] id,HttpServletRequest request){
		
		try {
			List<Source> sources = sourceService.selectByID(id);
			
			String filePath = request.getServletContext().getRealPath(DIRECTORY);
			
			for (Source source : sources) {
				sourceService.delete(source,filePath);
			}
			return "0";
		} catch (Exception e) {
			return "1";
		}
		
	}

}
