package com.linkai.controller.admin;


import com.linkai.entity.Category;
import com.linkai.enums.ResultDTO;
import com.linkai.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yamon
 * @since 2020-09-05
 */
@Controller
@RequestMapping("/admin/category")
public class CategoryController extends BaseController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 查询所有的商品类型
     * @return list
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("categories",categoryService.list());
        modelAndView.setViewName("/admin/category/index");
        return modelAndView;
    }

    /**
     * 保存一个商品类型
     * @param desc name
     * @return flag
     */
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> saveOneCategory(String desc){
        final Category entity = new Category();
        entity.setCatDesc(desc);
        final boolean save = categoryService.save(entity);
        return super.successSaveInfo(save);
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    public ResultDTO<Category> getOneCategory(Integer id){
        final Category category = categoryService.getById(id);
        return super.requestInfo(category);
    }
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> updateCategoryById(@ModelAttribute Category category){
        final boolean b = categoryService.updateById(category);
        return super.updateInfo(b);
    }
    @RequestMapping(value = "delete",method = RequestMethod.GET)
    @ResponseBody
    public ResultDTO<Boolean> deleteCategoryById(Integer id){
        final boolean b = categoryService.removeById(id);
        return super.successDeleteInfo(b);
    }



    /**
     * 批量删除
     * @return flag
     */
    @RequestMapping(value = "deleteSome",method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> deleteBatch(@RequestParam("selects[]") Integer[] selects){
        final boolean b = categoryService.removeByIds(Arrays.asList(selects));
        return super.successDeleteInfo(b);
    }
    /**
     * 获取所有的分类
     *
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public List<Category> listAll() {
        return categoryService.list();
    }


}

