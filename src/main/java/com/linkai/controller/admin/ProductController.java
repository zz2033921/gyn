package com.linkai.controller.admin;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linkai.dto.AdminProductDto;
import com.linkai.dto.AdminProductIdAndNameDto;
import com.linkai.dto.AdminProductPriceNameDto;
import com.linkai.dto.ProductDetailDto;
import com.linkai.entity.*;
import com.linkai.enums.CustomizeVariable;
import com.linkai.enums.ResultDTO;
import com.linkai.service.*;
import com.linkai.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author yamon
 * @since 2020-09-04
 */
@Controller
@RequestMapping("/admin/product")
public class ProductController extends BaseController {
    @Autowired
    private ProductService productService;
    @Autowired
    private ProSizeService proSizeService;
    @Autowired
    private ProColorService proColorService;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;
    @Autowired
    private ImgService imgService;
    @Autowired
    private SizeService sizeService;
    @Autowired
    private ColorService colorService;
    @Autowired
    private CategoryService categoryService;

    /**
     * 商品管理首页
     *
     * @return view
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView();
        final List<AdminProductDto> list = productService.listAdminProductDto();
        modelAndView.addObject("products", list);
        modelAndView.setViewName("/admin/product/index");
        return modelAndView;
    }

    /**
     * 商品管理添加
     *
     * @return view
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/product/add");
        return modelAndView;
    }

    /**
     * 保存一个商品
     *
     * @return 商品id
     */
    @RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Object> saveProduct(String proTitle, String proPrice, Integer proNumber,
                                         boolean proIsHot, boolean proIsNew, @RequestParam(value = "size[]") Integer[] size,
                                         @RequestParam(value = "color[]") Integer[] color, Integer category,
                                         @RequestParam(required = false) String proDesc, String proBrand) {
        final Product product = new Product();
        product.setProTitle(proTitle);
        product.setProDesc(StringUtils.isEmpty(proDesc) ? proTitle : proDesc);
        product.setProBrand(StringUtils.isEmpty(proBrand) ? CustomizeVariable.LINKAI.getName() : proBrand);
        product.setProPrice(new BigDecimal(proPrice));
        product.setProNumber(proNumber);
        product.setProIsHot(proIsHot);
        product.setProIsNew(proIsNew);
        product.setCatId(category);
        final boolean save = productService.save(product);
        if (save) {
            //保存商品成功
            Collection<ProSize> proSizes = new ArrayList<>();
            for (Integer integer : size) {
                ProSize proSize = new ProSize();
                proSize.setSizeId(integer);
                proSize.setProId(product.getProId());
                proSizes.add(proSize);
            }
            proSizeService.saveBatch(proSizes);
            //保存颜色
            Collection<ProColor> proColors = new ArrayList<>();
            for (Integer integer : color) {
                ProColor proColor = new ProColor();
                proColor.setProId(product.getProId());
                proColor.setColorId(integer);
                proColors.add(proColor);
            }
            proColorService.saveBatch(proColors);
            return super.returnObject4SaveInfo(product);
        }
        return super.returnObject4SaveInfo(null);
    }

    /**
     * 跳转到添加图片页面
     *
     * @param id id
     * @return view
     */
    @RequestMapping(value = "/complete/{id}", method = RequestMethod.GET)
    public ModelAndView redirect2Img(@PathVariable(value = "id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        //存进redis
        stringRedisTemplate.opsForValue().set("proId", String.valueOf(id));
        modelAndView.setViewName("/admin/product/complete");
        return modelAndView;
    }

    /**
     * 保存商品的尺寸属性
     *
     * @param selects selects
     * @return resultDto
     */
    @RequestMapping(value = "/saveSize4Product", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> saveSize4Product(@RequestParam("selects[]") String[] selects, @RequestParam(value = "proId") Integer proId) {
        Collection<ProSize> proSizeCollection = new ArrayList();
        for (String select : selects) {
            ProSize proSize = new ProSize();
            proSize.setSizeId(Integer.parseInt(select));
            proSize.setProId(proId);
            proSizeCollection.add(proSize);
        }
        final boolean b = proSizeService.saveBatch(proSizeCollection);
        return super.updateInfo(b);
    }

    /**
     * 批量删除
     *
     * @param selects
     * @return
     */
    @RequestMapping(value = "/deleteSize", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> deleteSize(@RequestParam("selects[]") String[] selects) {
        Collection<ProSize> proSizeCollection = new ArrayList();
        for (String select : selects) {
            ProSize proSize = new ProSize();
            proSize.setSizeId(Integer.parseInt(select));
            proSizeCollection.add(proSize);
        }
        final boolean b = proSizeService.saveBatch(proSizeCollection);
        return super.updateInfo(b);
    }

    /**
     * 设置产品的颜色
     *
     * @param selects
     * @param proId
     * @return
     */
    @RequestMapping(value = "/saveColor4Product", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> saveColor4Product(@RequestParam("selects[]") String[] selects, @RequestParam(value = "proId") Integer proId) {
        Collection<ProColor> proColorCollection = new ArrayList();
        for (String select : selects) {
            ProColor proColor = new ProColor();
            proColor.setColorId(Integer.parseInt(select));
            proColor.setProId(proId);
            proColorCollection.add(proColor);
        }
        final boolean b = proColorService.saveBatch(proColorCollection);
        return super.updateInfo(b);
    }

    /**
     * 删除商品单个
     *
     * @param proId proId
     * @return 成功标志
     */
    @RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> deleteProductById(Integer proId) {
        //逻辑删除照片
        final QueryWrapper<Img> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("pro_id", proId);
        imgService.remove(queryWrapper);
        final boolean b = productService.removeById(proId);
        return super.successDeleteInfo(b);
    }

    /**
     * 删除多个商品
     *
     * @param selects select
     * @return 标志
     */
    @RequestMapping(value = "/deleteBatchProduct", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> deleteBatchProduct(@RequestParam("selects[]") Integer[] selects) {
        //逻辑删除照片
        final boolean b = productService.removeByIds(Arrays.asList(selects));
        return super.successDeleteInfo(b);
    }


    /**
     * 查看对应的商品照片
     *
     * @param proId proId
     * @return list
     */
    @RequestMapping(value = "/getImgs", method = RequestMethod.GET)
    @ResponseBody
    public List<Img> getListOfProductImg(Integer proId) {
        final QueryWrapper<Img> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("pro_id", proId);
        return imgService.list(queryWrapper);
    }

    /**
     * 跳转到添加图片页面
     *
     * @param proId id
     * @return view
     */
    @RequestMapping(value = "/showOneProduct/{proId}", method = RequestMethod.GET)
    public ModelAndView redirectProductDetail(@PathVariable(value = "proId") Integer proId) {
        ModelAndView modelAndView = new ModelAndView();
        final Product product = productService.getById(proId);
        final QueryWrapper<ProSize> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("pro_id", proId);
        final List<ProSize> proSizes = proSizeService.list(queryWrapper);
        //查出所有的sizeId，然后根据sizeId查询出所有的sizeDesc
        List<Integer> sizeIds = new ArrayList<>();
        for (ProSize proSize : proSizes) {
            sizeIds.add(proSize.getSizeId());
        }
        List<String> sizeDesc = new ArrayList<>();
        final List<Size> sizes = sizeService.listByIds(sizeIds);
        for (Size size : sizes) {
            sizeDesc.add(size.getSizeDesc());
        }
        //查出所有的color
        final QueryWrapper<ProColor> colorQueryWrapper = new QueryWrapper<>();
        colorQueryWrapper.eq("pro_id", proId);
        final List<ProColor> proColors = proColorService.list(colorQueryWrapper);
        List<Integer> colorIds = new ArrayList<>();
        for (ProColor proColor : proColors) {
            colorIds.add(proColor.getColorId());
        }
        List<String> colorDesc = new ArrayList<>();
        final List<Color> colors = colorService.listByIds(colorIds);
        for (Color color : colors) {
            colorDesc.add(color.getColDesc());
        }
        //分类
        final Category category = categoryService.getById(product.getCatId());
        if (category != null) {
            modelAndView.addObject("category", category.getCatDesc());
        }
        modelAndView.addObject("size", sizeDesc);
        modelAndView.addObject("color", colorDesc);
        modelAndView.addObject("product", product);

        modelAndView.setViewName("/admin/product/detail");
        return modelAndView;
    }

    /**
     * 更新一个商品
     *
     * @param proId proId
     * @return 成功标志
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> updateProduct(String proName, String proPrice, Integer proNumber, Integer proId,
                                            boolean proIsHot, boolean proIsNew, @RequestParam(value = "size[]", required = false) Integer[] size,
                                            @RequestParam(value = "color[]", required = false) Integer[] color,
                                            @RequestParam(value = "category", required = false) Integer category,
                                            @RequestParam(required = false) String proDesc, String proBrand) {
        //更新
        //尺寸
        if (size != null) {
            final QueryWrapper<ProSize> proSize = new QueryWrapper<>();
            proSize.eq("pro_id", proId);
            final List<ProSize> proSizeList = proSizeService.list(proSize);
            for (int i = 0; i < size.length; i++) {
                proSizeList.get(i).setSizeId(size[i]);
            }
            proSizeService.updateBatchById(proSizeList);
        }
        //颜色
        if (color != null) {
            final QueryWrapper<ProColor> proColorQueryWrapper = new QueryWrapper<>();
            proColorQueryWrapper.eq("pro_id", proId);
            final List<ProColor> proColorList = proColorService.list(proColorQueryWrapper);
            for (int i = 0; i < color.length; i++) {
                proColorList.get(i).setColorId(color[i]);
            }
            proColorService.updateBatchById(proColorList);
        }
        //产品
        //转换为BigDecimal
        BigDecimal changePrice = new BigDecimal(proPrice);
        final Product product = new Product();
        product.setProId(proId);
        product.setProTitle(proName);
        product.setProDesc(proDesc);
        product.setProBrand(proBrand);
        product.setProPrice(changePrice);
        product.setProNumber(proNumber);
        product.setProIsHot(proIsHot);
        product.setProIsNew(proIsNew);
        if (category != null) {
            product.setCatId(category);
        }
        final boolean b = productService.updateById(product);
        return super.updateInfo(b);
    }

    /**
     * 显示修改图片界面
     *
     * @param proId proId
     * @return list
     */
    @RequestMapping(value = "/showProImg/{proId}", method = RequestMethod.GET)
    public ModelAndView showProductImg(@PathVariable(value = "proId") Integer proId) {
        ModelAndView modelAndView = new ModelAndView();
        //找出所有的照片
        final QueryWrapper<Img> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("pro_id", proId);
        final List<Img> imgs = imgService.list(queryWrapper);
        stringRedisTemplate.opsForValue().set("proId", String.valueOf(proId));
        modelAndView.addObject("imgs", imgs);
        modelAndView.addObject("proId", proId);
        modelAndView.setViewName("/admin/product/showProImg");
        return modelAndView;
    }

    /**
     * 查找一个商品
     *
     * @param proId proId
     * @return 返回实体类
     */
    @RequestMapping(value = "/setIndexProduct/{proId}", method = RequestMethod.GET)
    public ModelAndView getOneProduct(@PathVariable("proId") Integer proId) {
        ModelAndView modelAndView = new ModelAndView();
        ProductDetailDto productDetailDto = productService.getOneProductByProId(proId);
        if (productDetailDto == null) {
            return null;
        } else {
            final List<String> imgList = productDetailDto.getImgList().stream().map(Img::getImgUrl).collect(Collectors.toList());
            modelAndView.addObject("product", productDetailDto);
            modelAndView.addObject("imgList", imgList);
            modelAndView.setViewName("/admin/product/chooseProductImg");
        }
        return modelAndView;
    }

    /**
     * 设置商品的为首页商品
     *
     * @param proId proId
     * @return 成功标志
     */
    @RequestMapping(value = "/setIndexImg4Product", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> setIndexImg4Product(Integer proId, String indexImg) {
        final Product product = new Product();
        product.setProId(proId);
        product.setProIsIndex(1);
        product.setProIsIndexImgUpdateTime(new Date());
        product.setProIndexImg(indexImg);
        final boolean b = productService.updateById(product);
        return super.updateInfo(b);
    }

    /**
     * 得到商品价格和名字
     * @param proId proId
     * @return object
     */
    @RequestMapping(value = "/getProductNameAndPrice", method = RequestMethod.GET)
    @ResponseBody
    public AdminProductPriceNameDto getProductInfoNameAndPrice(Integer proId) {
        return productService.getProductNameAndPrice(proId);
    }

    /**
     * 更新折率
     * @param productPriceNameDto 实体
     * @return flag
     */
    @RequestMapping(value = "/sale/update", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> updateSaleProduct(@ModelAttribute AdminProductPriceNameDto productPriceNameDto) {
        boolean flag = productService.updateSaleProduct(productPriceNameDto);
        return super.updateInfo(flag);
    }

    /**
     * 获取所有商品的名字和id
     * @return
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @ResponseBody
    public List<AdminProductIdAndNameDto> listAllName(){
        List<AdminProductIdAndNameDto> list = new ArrayList<>();
        list = productService.listAllNameAndIdDto();
        return list;
    }



}

