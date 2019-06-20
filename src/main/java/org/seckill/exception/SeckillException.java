package org.seckill.exception;

/**
 * 秒杀相关业务异常
 *
 * @author 张韧炼
 * @create 2019-05-30 15:42
 **/
public class SeckillException extends RuntimeException {

    public SeckillException(String message) {
        super(message);
    }

    public SeckillException(String message, Throwable cause) {
        super(message, cause);
    }
}
