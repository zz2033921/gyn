package com.linkai.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.linkai.dto.AdminProductDto;
import com.linkai.dto.AdminProductIdAndNameDto;
import com.linkai.dto.IndexProductDto;
import com.linkai.dto.ProductDetailDto;
import com.linkai.entity.Product;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author yamon
 * @since 2020-10-05
 */
@Repository
public interface ProductMapper extends BaseMapper<Product> {

    List<AdminProductDto> listAdminProductDto();

    List<IndexProductDto> listIndexProducts(Integer catId);

    ProductDetailDto selectOneProductByProId(Integer proId);

    List<Product> listAllIndexProduct();

    /**
     * 列出所有的打折商品用于首页
     * @return list
     */
    List<IndexProductDto> listIndexOnSaleProducts();

    /**
     * 更新点击量
     * @param proId proId
     * @return int
     */
    int updateProCountByProId(Integer proId);

    List<ProductDetailDto> listPorpularProduct();

    /**
     * 查出所有的新产品
     * @return list
     */
    List<IndexProductDto> listAllNewestProduct();

    /**
     * 累出所有热的商品
     * @return list
     */
    List<IndexProductDto> listALlHotProducts();

    /**
     * 返回所有商品的id和name
     * @return list
     */
    List<AdminProductIdAndNameDto> listAllNameAndIdDto();

}
