package org.seckill.utils;

import java.util.Collection;

/**
 * String工具类
 *
 * @author 张韧炼
 * @create 2019-05-30 17:11
 **/
public class StringUtils {

    /**
     * 判断字符串为空
     *
     * @param cs
     * @return
     */
    public static boolean isEmpty(CharSequence cs) {
        return cs == null || cs.length() == 0;
    }

    /**
     * 判断集合为空
     *
     * @param collection
     * @return
     */
    public static boolean isEmpty(Collection<?> collection) {
        return collection == null || collection.size() == 0;
    }

    /**
     * 判断对象为空
     *
     * @param object
     * @return
     */
    public static boolean isEmpty(Object object) {
        return org.springframework.util.StringUtils.isEmpty(object);
    }
}
