package com.linkai.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.linkai.dto.*;
import com.linkai.entity.*;
import com.linkai.mapper.*;
import com.linkai.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author yamon
 * @since 2020-10-05
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProSizeMapper proSizeMapper;
    @Autowired
    private SizeMapper sizeMapper;
    @Autowired
    private ProColorMapper proColorMapper;
    @Autowired
    private ColorMapper colorMapper;
    @Autowired
    private ImgMapper imgMapper;

    /**
     * 管理员界面产品信息
     *
     * @return list
     */
    @Override
    public List<AdminProductDto> listAdminProductDto() {
        return productMapper.listAdminProductDto();

    }

    /**
     * 首页所有商品
     *
     * @param catId
     * @return list
     */
    @Override
    public List<IndexProductDto> listIndexProducts(Integer catId) {
        return productMapper.listIndexProducts(catId);
    }

    /**
     * 获得单个商品展示用
     *
     * @param proId proId
     * @return object
     */
    @Override
    public ProductDetailDto getOneProductByProId(Integer proId) {
        //找到所有的size
        final QueryWrapper<ProSize> proSizeQueryWrapper = new QueryWrapper<>();
        proSizeQueryWrapper.eq("pro_id", proId);
        final List<ProSize> proSizes = proSizeMapper.selectList(proSizeQueryWrapper);
        final ProductDetailDto productDetailDto = productMapper.selectOneProductByProId(proId);
        List<Size> sizes = new ArrayList<>();
        proSizes.forEach(proSize -> sizes.add(sizeMapper.selectById(proSize.getSizeId())));
        productDetailDto.setSizeList(sizes);
        //找到所有的color
        final QueryWrapper<ProColor> colorQueryWrapper = new QueryWrapper<>();
        colorQueryWrapper.eq("pro_id", proId);
        final List<ProColor> proColors = proColorMapper.selectList(colorQueryWrapper);
        List<Color> colors = new ArrayList<>();
        proColors.forEach(proColor -> colors.add(colorMapper.selectById(proColor.getColorId())));
        productDetailDto.setColorList(colors);
        //img
        final QueryWrapper<Img> imgQueryWrapper = new QueryWrapper<>();
        imgQueryWrapper.eq("pro_id", proId);
        final List<Img> imgList = imgMapper.selectList(imgQueryWrapper);
        productDetailDto.setImgList(imgList);
        //更新【点击量用于查询流行程度
        int i = productMapper.updateProCountByProId(proId);
        return productDetailDto;
    }

    /**
     * 查看所有的商品信息
     *
     * @return list
     */
    @Override
    public List<Product> listAllIndexProduct() {
        return productMapper.listAllIndexProduct();
    }

    /**
     * 获得商品的名字和价格
     *
     * @param proId proId
     * @return dto
     */
    @Override
    public AdminProductPriceNameDto getProductNameAndPrice(Integer proId) {
        final Product product = productMapper.selectById(proId);
        final AdminProductPriceNameDto target = new AdminProductPriceNameDto();
        BeanUtils.copyProperties(product, target);
        return target;
    }

    /**
     * 更新商品的折扣率和价格
     *
     * @param productPriceNameDto dto
     * @return flag
     */
    @Override
    public boolean updateSaleProduct(AdminProductPriceNameDto productPriceNameDto) {
        final Product product = new Product();
        product.setProIsOnSale(true);
        BeanUtils.copyProperties(productPriceNameDto, product);
        final int i = productMapper.updateById(product);
        return i == 1;
    }

    @Override
    public List<IndexProductDto> listIndexOnSaleProducts() {
        return productMapper.listIndexOnSaleProducts();
    }

    /**
     * 展示固定的流行商品
     *
     * @return list
     */
    @Override
    public List<ProductDetailDto> listPropularProduct() {
        return productMapper.listPorpularProduct();
    }

    /**
     * 列出所有新产品
     *
     * @return list
     */
    @Override
    public List<IndexProductDto> listAllNewestProduct() {
        return productMapper.listAllNewestProduct();
    }

    /**
     * 列出所有最火的商品
     *
     * @return list
     */
    @Override
    public List<IndexProductDto> listAllHotProduct() {
        return productMapper.listALlHotProducts();
    }

    /**
     * 返回商品名字和id
     *
     * @return list
     */
    @Override
    public List<AdminProductIdAndNameDto> listAllNameAndIdDto() {
        return productMapper.listAllNameAndIdDto();
    }
}
