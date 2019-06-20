package org.seckill.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.entity.SuccessKilled;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SuccessKilledDaoTest {
    @Resource
    private SuccessKilledDao successKilledDao;

    @Test
    public void insertSuccessKilled() {
        /**
         * 第一次：insertCount=1
         * 第二次：insertCount=0
         * 因为建表success_killed,使用了联合主键所以不会重复插入PRIMARY KEY (seckill_id,user_phone),
         * INSERT ignore INTO success_killed(seckill_id, user_phone)。。这里使用了ignore忽略了插入失败报错
         */
        Long id = 1001L;
        Long phone = 13052181181L;
        int insertCount = successKilledDao.insertSuccessKilled(id, phone);
        System.out.println("insertCount=" + insertCount);
    }

    @Test
    public void queryByIdWithSeckill() {
        Long id = 1001L;
        Long phone = 13052181181L;
        SuccessKilled successKilled = successKilledDao.queryByIdWithSeckill(id, phone);
        System.out.println("successKilled=" + successKilled);
        System.out.println("seckill=" + successKilled.getSeckill());
    }
}