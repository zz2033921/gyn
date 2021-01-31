package com.linkai.service;

import com.linkai.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yamon
 * @since 2021-01-29
 */
public interface UserService extends IService<User> {
   List<User> getUserByUsername(String username);
}
