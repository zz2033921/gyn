package com.linkai.enums;

/**
 * @Author yamon
 * @Date 2020-09-28 18:42
 * @Description
 * @Version 1.0
 */
public enum CustomizeVariable {
    /**
     * 林楷服饰关键字
     */
    LINKAI("林楷服饰"),

    /**
     * 牛仔工作套装
     */
    COWBOY_SUIT("牛仔工作服套装"),

    /**
     * 牛仔工作服裤子
     */
    COWBOY_PLANT("牛仔工作服裤子"),
    /**
     * 牛仔单上衣
     */
    COWBOY_LAP("牛仔单上衣"),
    /**
     * 夏季牛仔工作服
     */
    COWBOY_SUMMER("夏季牛仔工作服"),
    /**
     * 涤卡套装
     */
    DACRON_SUIT("涤卡套装"),
    /**
     * 涤卡套装
     */
    WINTER_COTTON("冬季棉服"),
    /**
     * 涤卡套装
     */
    ALL_PRODUCT("全部商品"),
    ON_SALE_PRODUCT("打折商品"),
    NEWEST_PRODUCT("最新商品"),
    HOT_PRODUCT("最热商品"),
    PUSH_NEW("推新历史");


    /**
     * 状态描述
     */
    private String name;

    CustomizeVariable(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
