package jin.base.util;

import java.io.File;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.zip.CRC32;
import java.util.zip.CheckedOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.FileUtils;

public class ZipUtil {
	
	public static String CHARSET = "UTF-8";
	
	public static void zip(File file,OutputStream out) throws Exception{
		
		ZipOutputStream zipOut = initZipOutStream(out);
		zip(file, file.getName(), zipOut);
		zipOut.close();;
		
	}
	
	public static void zip(File[] files,OutputStream out) throws Exception{
		ZipOutputStream zipOut = initZipOutStream(out);
		for (File file : files) {
			zip(file, file.getName(), zipOut);
		}
		zipOut.close();
	}
	/**
	 * instance zipOutPutStream
	 * default charset is utf-8
	 * @param out
	 * @return
	 */
	private  static ZipOutputStream initZipOutStream(OutputStream out){
		 return initZipOutStream(out,CHARSET);
	}
	private  static ZipOutputStream initZipOutStream(OutputStream out,String charset){
		 return new ZipOutputStream( new CheckedOutputStream(out,new CRC32()), Charset.forName(charset));
	}
	
	public static void zip(File file,String entryName,ZipOutputStream zipOut) throws Exception{
		if(file.isDirectory()){
			
			File[] files = file.listFiles();
			if(files.length == 0){
				zipOut.putNextEntry(new ZipEntry( entryName + "/"));
			}
			for (File file2 : files) {
				zip(file2, entryName + "/" + file2.getName(), zipOut);
			}
		}else{
			zipOut.putNextEntry(new ZipEntry( entryName));
			zipOut.write(FileUtils.readFileToByteArray(file));
		} 
		
	}
	

}
