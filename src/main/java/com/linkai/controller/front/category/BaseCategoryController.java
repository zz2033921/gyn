package com.linkai.controller.front.category;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linkai.dto.IndexProductDto;
import com.linkai.dto.IndexPushNewDto;
import com.linkai.entity.Category;
import com.linkai.entity.PushNew;
import com.linkai.service.CategoryService;
import com.linkai.service.ProductService;
import com.linkai.service.PushNewService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @Author yamon
 * @Date 2020-09-17 20:32
 * @Description 基类
 * @Version 1.0
 */
public class BaseCategoryController {
    @Autowired
    public ProductService productService;
    @Autowired
    public CategoryService categoryService;
    @Autowired
    private PushNewService pushNewService;


    /**
     * 按照catDesc找到catId，然后获得所有catId的产品
     * @param page page
     * @param catDesc 描述
     * @return page
     */
    public PageInfo<IndexProductDto> getProductWithPage(Integer page,Integer pageSize,String orderBy,String catDesc){
        final QueryWrapper<Category> categoryQueryWrapper = new QueryWrapper<>();
        categoryQueryWrapper.eq("cat_desc",catDesc);
        final Category category = categoryService.getOne(categoryQueryWrapper);
        PageHelper.startPage(page,pageSize,orderBy);
        List<IndexProductDto> products = productService.listIndexProducts(category.getCatId());
        return new PageInfo<>(products);
    }

    /**
     * 根据是否打折商品进行过滤
     * @param page page
     * @return page
     */
    public PageInfo<IndexProductDto> getSaleProductsWithPage(Integer page,Integer pageSize,String orderBy){
        PageHelper.startPage(page,pageSize,orderBy);
        List<IndexProductDto> products = productService.listIndexOnSaleProducts();
        return new PageInfo<>(products);
    }

    /**
     * 列出所有的最新商品
     * @param page page
     * @param pageSize pageSize
     * @param orderBy orderBy
     * @return list
     */
    protected PageInfo<IndexProductDto> getNewestProductsWithPage(Integer page, Integer pageSize, String orderBy) {
        PageHelper.startPage(page,pageSize,orderBy);
        List<IndexProductDto> products = productService.listAllNewestProduct();
        return new PageInfo<>(products);
    }

    protected PageInfo<IndexProductDto> getHotProductsWithPage(Integer page, Integer pageSize, String orderBy) {
        PageHelper.startPage(page,pageSize,orderBy);
        List<IndexProductDto> products = productService.listAllHotProduct();
        return new PageInfo<>(products);
    }

    protected PageInfo<IndexPushNewDto> getPushNewProductsWithPage(Integer page, int pageSize, String orderBy) {
        PageHelper.startPage(page,pageSize,orderBy);
        List<IndexPushNewDto> products = pushNewService.listAllPushNewProduct();
        return new PageInfo<>(products);
    }
}
