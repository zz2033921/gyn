package com.linkai.controller.front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linkai.controller.admin.BaseController;
import com.linkai.dto.ProductDetailDto;
import com.linkai.entity.Platform;
import com.linkai.entity.Product;
import com.linkai.entity.User;
import com.linkai.enums.ResultDTO;
import com.linkai.service.PlatformService;
import com.linkai.service.ProductService;
import com.linkai.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author yamon
 * @Date 2020/8/29 20:21
 * @Description
 * @Version 1.0
 */
@Controller
public class IndexController extends BaseController {
    @Autowired
    private ProductService productService;
    @Autowired
    private PlatformService platformService;
    @Autowired
    private UserService userService;

    /**
     * 登录
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView loginIndex() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/front/login");
        return modelAndView;
    }

    /**
     * 首页
     *
     * @return 首页
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView frontIndex() {
        ModelAndView modelAndView = new ModelAndView();
        //获得首页展示商品
        final QueryWrapper<Product> productQueryWrapper = new QueryWrapper<>();
        productQueryWrapper.eq("pro_is_index", 1).orderByDesc("pro_is_index_img_update_time");
        final List<Product> list = productService.list(productQueryWrapper);
        List<ProductDetailDto> productDetailDtos = productService.listPropularProduct();
        modelAndView.addObject("product", list.get(0));
        modelAndView.addObject("popular", productDetailDtos);
        modelAndView.setViewName("/front/index");
        return modelAndView;
    }

    /**
     * 首页
     *
     * @return 首页
     */
    @RequestMapping(value = "/platform/get", method = RequestMethod.GET)
    @ResponseBody
    public List<Platform> getPlatform() {
        //获得首页展示商品
        return platformService.list();
    }


    /**
     * home page
     *
     * @return
     */
    @RequestMapping(value = "/shop", method = RequestMethod.GET)
    public String shopIndex() {
        //返回所有的信息
        return "/front/shop";
    }

    /**
     * product detail
     *
     * @return
     */
    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public String productIndex() {
        return "product";
    }

    /**
     * pay page
     *
     * @return
     */
    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String checkOutIndex() {
        return "/front/checkout";
    }


    @RequestMapping(value = "/induction", method = RequestMethod.GET)
    public String singleBlogIndex() {
        return "/front/single-blog";
    }

    /**
     * 这个页面可以做成工厂简介
     *
     * @return
     */
    @RequestMapping(value = "/regular", method = RequestMethod.GET)
    public String regularIndex() {
        return "/front/regular-page";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contactIndex() {
        return "/front/contact";
    }

    @RequestMapping(value = "/admin/index", method = RequestMethod.GET)
    public String adminIndex() {
        return "admin/index";
    }
//    @RequestMapping(value = "/admin/index1",method = RequestMethod.GET)
//    public String adminIndexV1(){
//        return "admin/index_v1";
//    }

    /**
     * 跳转地图页面
     */
    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String mapIndex() {
        return "/front/map";
    }

    /**
     * 保存一个用户
     */
    @RequestMapping(value = "/registrationOk", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> saveUser( User user){
        final boolean save= userService.save(user);

        return super.successSaveInfo(save);
    }
    /**
     * 检查登录
     */
    @RequestMapping(value = "/isUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> isUser(@RequestParam String username,@RequestParam String password){
        List<User> users=userService.getUserByUsername(username);
        Map<String,Object> returnMap=new HashMap<>();
            for (User user : users) {
                if (user.getPassword().equals(password)) {
                    returnMap.put("message","success");
                    return returnMap;
                }
            }
        returnMap.put("message","fail");
        return returnMap;
    }
    /**
     * 付款界面
     */
    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public ModelAndView checkoutIndex() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/front/checkout");
        return modelAndView;
    }
}
