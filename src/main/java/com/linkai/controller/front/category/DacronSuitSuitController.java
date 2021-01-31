package com.linkai.controller.front.category;

import com.github.pagehelper.PageInfo;
import com.linkai.dto.IndexProductDto;
import com.linkai.enums.CustomizeVariable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Author yamon
 * @Date 2020-09-20 19:19
 * @Description 夏季牛仔工作服
 * @Version 1.0
 */
@Controller
@RequestMapping("/category/dacronSuit")
public class DacronSuitSuitController extends BaseCategoryController{
    /**
     * 夏季牛仔套装的首页
     * @return 视图
     */
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public ModelAndView cowBoySuitIndex(@RequestParam(value = "pageNum",required = false)Integer page){
        if (page==null){
            page =1;
        }
        ModelAndView modelAndView = new ModelAndView();
        final PageInfo<IndexProductDto> pageInfo= super.getProductWithPage(page, 6, "create_time desc", "涤卡套装");
        modelAndView.addObject("page",pageInfo);
        modelAndView.addObject("tag", CustomizeVariable.DACRON_SUIT.getName());
        modelAndView.setViewName("/front/category/dacronSuit");
        return modelAndView;
    }
}
