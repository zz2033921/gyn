package com.linkai.service.impl;

import com.linkai.entity.Img;
import com.linkai.service.FileImgService;
import com.linkai.service.ImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * @Author yamon
 * @Date 2020-09-12 19:33
 * @Description
 * @Version 1.0
 */
@Service
public class FileImgServiceImpl implements FileImgService {
    @Autowired
    private ImgService imgService;
    /**
     * 保存一个文件信息到数据库
     *
     * @param file file
     * @param proId proId
     * @param fileUrlInfo
     * @return 是否保存成功
     */
    @Override
    public int save2Db(MultipartFile file, int proId, Map<String, String> fileUrlInfo) {
        final Img img = new Img();
        img.setImgTitle(file.getOriginalFilename());
        img.setImgSize((double) file.getSize());
        img.setImgType(file.getContentType());
        img.setProId(proId);
        //取map
        final String url = fileUrlInfo.get("fileName");
        img.setImgUrl("/"+url);
        final String pathFileName = fileUrlInfo.get("pathFileName");
        img.setImgLocalUrl(pathFileName);
        imgService.save(img);
        return img.getImgId();
    }

    /**
     * 根据ImgId删除信息
     *
     * @param imgId imgId
     */
    @Override
    public void deleteByImgId(Integer imgId) {
        imgService.removeById(imgId);
    }

    /**
     * 保存pushNew文件
     *
     * @param file        file
     * @param fileUrlInfo 文件信息
     * @return int
     */
    @Override
    public int save2Db_pushNew(MultipartFile file, Map<String, String> fileUrlInfo) {
        final Img img = new Img();
        img.setImgTitle(file.getOriginalFilename());
        img.setImgSize((double) file.getSize());
        img.setImgType(file.getContentType());
        //取map
        final String url = fileUrlInfo.get("fileName");
        img.setImgUrl("/"+url);
        final String pathFileName = fileUrlInfo.get("pathFileName");
        img.setImgLocalUrl(pathFileName);
        imgService.save(img);
        return img.getImgId();
    }
}
