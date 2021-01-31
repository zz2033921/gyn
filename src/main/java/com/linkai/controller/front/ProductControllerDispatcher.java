package com.linkai.controller.front;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author yamon
 * @Date 2020-10-10 19:52
 * @Description 商品跳转类
 * @Version 1.0
 */
@Controller
@RequestMapping("/front")
public class ProductControllerDispatcher {
    private static final Logger logger = LoggerFactory.getLogger(ProductControllerDispatcher.class);

    @RequestMapping(value = "/product",method = RequestMethod.GET)
    public String redirect2Index(@RequestParam(value = "type",required = false) String type){
        if (type==null){
            //查询全部商品
            return "redirect:/category/shop";
        }
        switch (type){
            case "sale":
                logger.info("请求：--->打折区");
                return "redirect:/product/sale/index";
            case "cowBoyPlant":
                return "redirect:/category/cowBoyPlant/index";
            case "junior":
                return "redirect:/category/junior/index";
            case "super":
                return "redirect:/category/super/index";
            case "teacher":
                return "redirect:/category/teacher/index";
            case "staff":
                return "redirect:/category/staff/index";
            case "fiction":
                return "redirect:/category/fiction/index";
            case "literature":
                return "redirect:/category/literature/index";
            case "adolescence":
                return "redirect:/category/adolescence/index";
            case "art":
                return "redirect:/category/art/index";
            case "religion":
                return "redirect:/category/religion/index";
            case "history":
                return "redirect:/category/history/index";
            case "polices":
                return "redirect:/category/polices/index";
            case "culture":
                return "redirect:/category/culture/index";
            case "selfhelp":
                return "redirect:/category/selfhelp/index";
            case "cookie":
                return "redirect:/category/cookie/index";
            case "financing":
                return "redirect:/category/financing/index";
            case "science":
                return "redirect:/category/science/index";
            default:
                logger.warn("没有匹配到的url");
                return "redirect:/";
        }
    }
}
