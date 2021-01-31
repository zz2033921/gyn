package com.linkai.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.linkai.dto.*;
import com.linkai.entity.Product;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yamon
 * @since 2020-10-05
 */
public interface ProductService extends IService<Product> {
    /**
     * 管理员界面产品信息
     * @return list
     */
    List<AdminProductDto> listAdminProductDto();

    /**
     * 首页所有商品
     * @return list
     * @param catId
     */
    List<IndexProductDto> listIndexProducts(Integer catId);

    /**
     * 获得单个商品展示用
     * @param proId proId
     * @return object
     */
    ProductDetailDto getOneProductByProId(Integer proId);

    /**
     * 查看所有的商品信息
     * @return list
     */
    List<Product> listAllIndexProduct();

    /**
     * 获得商品的名字和价格
     * @param proId proId
     * @return dto
     */
    AdminProductPriceNameDto getProductNameAndPrice(Integer proId);

    /**
     * 更新商品的折扣率和价格
     * @param productPriceNameDto dto
     * @return flag
     */
    boolean updateSaleProduct(AdminProductPriceNameDto productPriceNameDto);

    List<IndexProductDto> listIndexOnSaleProducts();

    /**
     * 展示固定的流行商品
     * @return list
     */
    List<ProductDetailDto> listPropularProduct();

    /**
     * 列出所有新产品
     * @return list
     */
    List<IndexProductDto> listAllNewestProduct();

    /**
     * 列出所有最火的商品
     * @return list
     */
    List<IndexProductDto> listAllHotProduct();

    /**
     * 返回商品名字和id
     * @return list
     */
    List<AdminProductIdAndNameDto> listAllNameAndIdDto();

}
