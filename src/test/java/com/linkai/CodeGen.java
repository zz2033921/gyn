package com.linkai;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.po.TableFill;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

import java.util.ArrayList;

/**
 * @Author yamon
 * @Date 2020/8/31 19:59
 * @Description
 * @Version 1.0
 */
//代码自动生成器
public class CodeGen {
    public static void main(String[] args) {
        //需要构建一个代码生成对象
        final AutoGenerator mpg = new AutoGenerator();
        //配置策略

        //1、全局配置
        final GlobalConfig gc = new GlobalConfig();
        //当前项目路径
        final String projectPath = System.getProperty("user.dir");
        gc.setOutputDir(projectPath+"/src/main/java");
        gc.setAuthor("yamon");
        //打开window窗口
        gc.setOpen(false);
        //是否覆盖
        gc.setFileOverride(true);
        //去serviceI的前缀
        gc.setServiceName("%sService");
        gc.setIdType(IdType.AUTO);
        gc.setDateType(DateType.ONLY_DATE);
        gc.setSwagger2(true);

        mpg.setGlobalConfig(gc);
        //设置数据源
        final DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl("jdbc:mysql://localhost:3306/clothes?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC");
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("zhangdapeng155");
        dsc.setDbType(DbType.MYSQL);
        mpg.setDataSource(dsc);
        //配置包
        final PackageConfig pc = new PackageConfig();
        pc.setParent("com.linkai");
        pc.setEntity("entity");
        pc.setMapper("mapper");
        pc.setController("controller");
        pc.setService("service");
        mpg.setPackageInfo(pc);
        //策略配置
        StrategyConfig strategy = new StrategyConfig();
        //设置要映射的表名
        strategy.setInclude("user");
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        //自动生成Lombok
        strategy.setEntityLombokModel(true);
        //逻辑删除字段
        strategy.setLogicDeleteFieldName("deleted");

        //自动填充配置
        final TableFill createTime = new TableFill("create_time", FieldFill.INSERT);
        final TableFill updateTime = new TableFill("update_time", FieldFill.INSERT_UPDATE);
        final ArrayList<TableFill> tableFills = new ArrayList<>();
        tableFills.add(createTime);
        tableFills.add(updateTime);
        strategy.setTableFillList(tableFills);
        //驼峰命名
        strategy.setRestControllerStyle(true);
        //乐观锁
        strategy.setVersionFieldName("version");
        strategy.setControllerMappingHyphenStyle(true);
        mpg.setStrategy(strategy);

        //执行
        mpg.execute();

    }
}
