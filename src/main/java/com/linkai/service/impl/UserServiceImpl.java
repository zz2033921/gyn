package com.linkai.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linkai.entity.User;
import com.linkai.mapper.UserMapper;
import com.linkai.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author yamon
 * @since 2021-01-29
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private UserMapper userMapper;

  @Override
    public List<User> getUserByUsername(String username){
      QueryWrapper<User> users=new QueryWrapper<>();
      users.eq("username",username);
      return  userMapper.selectList(users);
  }
}
