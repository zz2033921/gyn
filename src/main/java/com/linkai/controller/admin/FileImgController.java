package com.linkai.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linkai.entity.Img;
import com.linkai.entity.PushImg;
import com.linkai.service.FileImgService;
import com.linkai.service.ImgService;
import com.linkai.service.PushImgService;
import com.linkai.utils.file.FileUploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @Author yamon
 * @Date 2020-09-11 20:37
 * @Description
 * @Version 1.0
 */
@RequestMapping("/admin/file")
@Controller
public class FileImgController extends BaseController{
    @Autowired
    private FileImgService fileImgService;
    @Autowired
    private ImgService imgService;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;
    @Autowired
    private PushImgService pushImgService;
    @RequestMapping(value = "/img/upload",method = RequestMethod.POST)
    @ResponseBody
    public String uploadProductImg(@RequestParam(value = "file")MultipartFile file){
        try {
            //先获取proId
            final String proId = stringRedisTemplate.opsForValue().get("proId");
            if (proId!=null){
                //将文件信息上传到数据库
                //先删除
                final QueryWrapper<Img> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("pro_id",proId);
                final boolean remove = imgService.remove(queryWrapper);
                //添加
                final Map<String,String> fileUrlInfo = FileUploadUtils.upload(file);
                fileImgService.save2Db(file,Integer.parseInt(proId),fileUrlInfo);
                //最后清空proId
                stringRedisTemplate.delete("proId");
            }else{
                System.out.println("proId is null!");
                return null;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "upload";
    }

    /**
     * 推新历史记录中的添加图片
     * @param file
     * @return
     */
    @RequestMapping(value = "/pushNew/upload",method = RequestMethod.POST)
    @ResponseBody
    public String uploadPushNewUploader(@RequestParam(value = "file")MultipartFile file){
        try {
            //先获取proId
            final String pushId = stringRedisTemplate.opsForValue().get("pushId");
            if (pushId!=null){
                //将文件信息上传到数据库
                //添加
                final Map<String,String> fileUrlInfo = FileUploadUtils.upload(file);
                int flag = fileImgService.save2Db_pushNew(file,fileUrlInfo);
                //最后清空pushId
                stringRedisTemplate.delete("pushId");
                //保存成功后，给两个表里保存信息
                if (flag!=0){
                    final PushImg entity = new PushImg();
                    entity.setImgId(flag);
                    entity.setPushId(Integer.valueOf(pushId));
                    pushImgService.save(entity);
                }
            }else{
                System.out.println("pushId is null!");
                return null;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "upload";
    }

    /**
     * 推广历史中的更新文件
     * @param file file
     * @return flag
     */
    @RequestMapping(value = "/pushNew/update",method = RequestMethod.POST)
    @ResponseBody
    public String updatePushNewUploader(@RequestParam(value = "file")MultipartFile file){
        try {
            //先获取pushId
            final String pushId = stringRedisTemplate.opsForValue().get("pushId");
            if (pushId!=null){
                //查找对应的imgId，先删除后添加
                final List<Img> imgsByPushId = pushImgService.getImgsByPushId(Integer.valueOf(pushId));
                if (imgsByPushId!=null){
                    imgsByPushId.forEach(img -> {
                        if (img!=null){
                            fileImgService.deleteByImgId(img.getImgId());
                        }
                    });
                }

                final QueryWrapper<PushImg> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("push_id",pushId);
                pushImgService.remove(queryWrapper);

                //添加
                final Map<String,String> fileUrlInfo = FileUploadUtils.upload(file);
                int flag = fileImgService.save2Db(file,Integer.parseInt(pushId),fileUrlInfo);
                //最后清空pushId
                stringRedisTemplate.delete("pushId");
                //保存成功后，给两个表里保存信息
                if (flag!=0){
                    final PushImg entity = new PushImg();
                    entity.setImgId(flag);
                    entity.setPushId(Integer.valueOf(pushId));
                    pushImgService.save(entity);
                }
            }else{
                System.out.println("pushId is null!");
                return null;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "upload";
    }

}
