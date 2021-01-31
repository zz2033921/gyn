package com.linkai.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * @Author yamon
 * @Date 2020-09-12 19:33
 * @Description
 * @Version 1.0
 */
public interface FileImgService {
    /**
     * 保存一个文件信息到数据库
     * @param file file
     * @param proId product id
     * @param fileUrlInfo
     * @return 是否保存成功
     */
    int save2Db(MultipartFile file, int proId, Map<String, String> fileUrlInfo);

    /**
     * 根据ImgId删除信息
     * @param imgId imgId
     */
    void deleteByImgId(Integer imgId);

    /**
     * 保存pushNew文件
     * @param file file
     * @param fileUrlInfo 文件信息
     * @return int
     */
    int save2Db_pushNew(MultipartFile file, Map<String, String> fileUrlInfo);
}
