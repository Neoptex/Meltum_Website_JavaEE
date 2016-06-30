package com.meltum.utils;

import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.web.multipart.MultipartFile;

public final class ImageUtils {

	 private static final Map<String, String> corresp;
	    static
	    {
	    	corresp = new HashMap<String, String>();
	    	corresp.put("image/jpeg", "jpg");
	    	corresp.put("image/png", "png");
	    }
	
	public static String scale(MultipartFile file, int width, int height) {
    	try {
    		ByteArrayInputStream in = new ByteArrayInputStream(file.getBytes());
    		BufferedImage img = ImageIO.read(in);
    		if(height == 0) {
    			height = (width * img.getHeight())/ img.getWidth(); 
    		}
    		if(width == 0) {
    			width = (height * img.getWidth())/ img.getHeight();
    		}
    		Image scaledImage = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
    		BufferedImage imageBuff = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
    		imageBuff.getGraphics().drawImage(scaledImage, 0, 0, new Color(0,0,0), null);

    		ByteArrayOutputStream buffer = new ByteArrayOutputStream();

    		ImageIO.write(imageBuff, corresp.get(file.getContentType()), buffer);

    		return Base64.encodeBase64String(buffer.toByteArray());
    	} catch (IOException e) {
    		e.printStackTrace();
    	}
    	return null;
    }
}
