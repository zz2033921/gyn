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
 * @author ：zdp
 * @date ：Created in 2020/12/28 15:42
 * @description：
 * @modified By：
 * @version: $
 */

@Controller
@RequestMapping("/category/literature")
public class LiteratureController extends BaseCategoryController{
    /**
     * 文学首页
     */
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public ModelAndView juniorIndex(@RequestParam(value = "pageNum",required=false)Integer page){
        if (page==null){
            page =1;
        }
        ModelAndView modelAndView = new ModelAndView();
        final PageInfo<IndexProductDto> pageInfo= super.getProductWithPage(page, 6, "create_time desc", "文学");
        modelAndView.addObject("page",pageInfo);
        modelAndView.addObject("tag", CustomizeVariable.COWBOY_PLANT.getName());
        modelAndView.setViewName("/front/category/literature");
        return modelAndView;
    }
}
